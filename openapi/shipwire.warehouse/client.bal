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
    http:CredentialsConfig auth;
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

# This is a generated connector for [Shipwire Warehouses API v3.0](https://www.shipwire.com/developers/warehouse/) OpenAPI specification.
# The Warehouse API is used to manage Shipwire Anywhere warehouses and dropship locations. 
# Use it to create a new warehouse, to update an existing warehouse, or to get information about already created warehouses.
@display {label: "Shipwire Warehouse", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shipwire account](https://www.shipwire.com) and obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.shipwire.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get warehouses
    #
    # + id - Filter by warehouse ids, supports comma separated list 
    # + externalId - Filter by warehouse external ids, supports comma separated list 
    # + name - Filter by warehouse names, supports comma separated list 
    # + vendorId - Filter by associated vendor's id, supports comma separated list 
    # + vendorExternalId - Filter by associated vendor's external id, supports comma separated list 
    # + country - Filter by country, supports comma separated list 
    # + generatesLabels - Filter by warehouses that require label generation 
    # + 'type - Filter by type ("SHIPWIRE", "SHIPWIRE_ANYWHERE") 
    # + return - OK 
    remote isolated function getWarehouses(int? id = (), string? externalId = (), string? name = (), int? vendorId = (), string? vendorExternalId = (), string? country = (), string? generatesLabels = (), string? 'type = ()) returns GetWarehousesResponse|error {
        string  path = string `/api/v3.1/warehouses`;
        map<anydata> queryParam = {"id": id, "externalId": externalId, "name": name, "vendorId": vendorId, "vendorExternalId": vendorExternalId, "country": country, "generatesLabels": generatesLabels, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        GetWarehousesResponse response = check self.clientEp-> get(path, targetType = GetWarehousesResponse);
        return response;
    }
    # Create a new warehouse
    #
    # + payload - Create a new warehouse request 
    # + return - OK 
    remote isolated function postWarehouse(CreateANewWarehouseRequest payload) returns CreateANewWarehouseResponse|error {
        string  path = string `/api/v3.1/warehouses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateANewWarehouseResponse response = check self.clientEp->post(path, request, targetType=CreateANewWarehouseResponse);
        return response;
    }
    # Get a warehouse
    #
    # + id - The warehouse id or external id. 
    # + return - OK 
    remote isolated function getWarehousesById(string id) returns GetAWarehouseResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}`;
        GetAWarehouseResponse response = check self.clientEp-> get(path, targetType = GetAWarehouseResponse);
        return response;
    }
    # Update a warehouse
    #
    # + id - The warehouse's id or external id. 
    # + payload - Update a warehouse request 
    # + return - Create a new warehouse response 
    remote isolated function putWarehousesById(string id, UpdateAWarehouseRequest payload) returns CreateANewWarehouseResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateANewWarehouseResponse response = check self.clientEp->put(path, request, targetType=CreateANewWarehouseResponse);
        return response;
    }
    # Retire a warehouse
    #
    # + id - Warehouse id or external id 
    # + return - Retire a warehouse response 
    remote isolated function postWarehousesRetireById(string id) returns RetireAWarehouseResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}/retire`;
        http:Request request = new;
        //TODO: Update the request as needed;
        RetireAWarehouseResponse response = check self.clientEp-> post(path, request, targetType = RetireAWarehouseResponse);
        return response;
    }
    # Get containers associated with a warehouse
    #
    # + id - The warehouse id or external id. 
    # + return - Get containers associated with a warehouse response 
    remote isolated function getWarehousesContainersById(string id) returns GetContainersAssociatedWithAWarehouseResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}/containers`;
        GetContainersAssociatedWithAWarehouseResponse response = check self.clientEp-> get(path, targetType = GetContainersAssociatedWithAWarehouseResponse);
        return response;
    }
    # Get carriers associated with a warehouse
    #
    # + id - The warehouse id or external id. 
    # + return - Get carriers response 
    remote isolated function getWarehousesCarriersById(string id) returns GetCarriersResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}/carriers`;
        GetCarriersResponse response = check self.clientEp-> get(path, targetType = GetCarriersResponse);
        return response;
    }
    # Add carriers to a warehouse
    #
    # + id - Warehouse id or external id. 
    # + payload - Add carrier request 
    # + return - Get carriers response 
    remote isolated function addCarriersByIdToWarehouse(string id, AddCarrierRequest payload) returns GetCarriersResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}/addCarriers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetCarriersResponse response = check self.clientEp->post(path, request, targetType=GetCarriersResponse);
        return response;
    }
    # Remove carriers to a warehouse
    #
    # + id - Warehouse id or external id. 
    # + payload - Remove carrier request 
    # + return - Get carriers response 
    remote isolated function removeCarriersByIdToWarehouse(string id, RemoveCarrierRequest payload) returns GetCarriersResponse|error {
        string  path = string `/api/v3.1/warehouses/${id}/removeCarriers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetCarriersResponse response = check self.clientEp->post(path, request, targetType=GetCarriersResponse);
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
