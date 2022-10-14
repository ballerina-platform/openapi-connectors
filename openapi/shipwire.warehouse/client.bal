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
    http:CredentialsConfig auth;
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
        return;
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
        string resourcePath = string `/api/v3.1/warehouses`;
        map<anydata> queryParam = {"id": id, "externalId": externalId, "name": name, "vendorId": vendorId, "vendorExternalId": vendorExternalId, "country": country, "generatesLabels": generatesLabels, "type": 'type};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetWarehousesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new warehouse
    #
    # + payload - Create a new warehouse request 
    # + return - OK 
    remote isolated function postWarehouse(CreateANewWarehouseRequest payload) returns CreateANewWarehouseResponse|error {
        string resourcePath = string `/api/v3.1/warehouses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateANewWarehouseResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a warehouse
    #
    # + id - The warehouse id or external id. 
    # + return - OK 
    remote isolated function getWarehousesById(string id) returns GetAWarehouseResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}`;
        GetAWarehouseResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a warehouse
    #
    # + id - The warehouse's id or external id. 
    # + payload - Update a warehouse request 
    # + return - Create a new warehouse response 
    remote isolated function putWarehousesById(string id, UpdateAWarehouseRequest payload) returns CreateANewWarehouseResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateANewWarehouseResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Retire a warehouse
    #
    # + id - Warehouse id or external id 
    # + return - Retire a warehouse response 
    remote isolated function postWarehousesRetireById(string id) returns RetireAWarehouseResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}/retire`;
        http:Request request = new;
        //TODO: Update the request as needed;
        RetireAWarehouseResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get containers associated with a warehouse
    #
    # + id - The warehouse id or external id. 
    # + return - Get containers associated with a warehouse response 
    remote isolated function getWarehousesContainersById(string id) returns GetContainersAssociatedWithAWarehouseResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}/containers`;
        GetContainersAssociatedWithAWarehouseResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get carriers associated with a warehouse
    #
    # + id - The warehouse id or external id. 
    # + return - Get carriers response 
    remote isolated function getWarehousesCarriersById(string id) returns GetCarriersResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}/carriers`;
        GetCarriersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add carriers to a warehouse
    #
    # + id - Warehouse id or external id. 
    # + payload - Add carrier request 
    # + return - Get carriers response 
    remote isolated function addCarriersByIdToWarehouse(string id, AddCarrierRequest payload) returns GetCarriersResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}/addCarriers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetCarriersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove carriers to a warehouse
    #
    # + id - Warehouse id or external id. 
    # + payload - Remove carrier request 
    # + return - Get carriers response 
    remote isolated function removeCarriersByIdToWarehouse(string id, RemoveCarrierRequest payload) returns GetCarriersResponse|error {
        string resourcePath = string `/api/v3.1/warehouses/${getEncodedUri(id)}/removeCarriers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetCarriersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
