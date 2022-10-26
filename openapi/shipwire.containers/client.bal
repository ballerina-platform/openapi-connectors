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

# This is a generated connector for [Shipwire Containers API v3.0](https://www.shipwire.com/developers/container/) OpenAPI specification.
# The Container API is used to manage shipping containers and boxes within Shipwire Anywhere warehouses and dropship locations. 
# Use it to create a new container, to update an existing container, or to get information about already created containers.
@display {label: "Shipwire Containers", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shipwire account](https://www.shipwire.com) and obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.shipwire.com/") returns error? {
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
    # Get containers
    #
    # + isActive - Returns containers that are active or not. Valid options are 1 or 0. 
    # + warehouseIds - Returns all containers that exist in the provided warehouse. Single warehouse's id or comma separated list of warehouse ids. 
    # + warehouseExternalIds - Returns all containers that exist in the provided warehouse. Single warehouse's external id or comma separated list of warehouse external ids. 
    # + 'type - Container type. Valid options are 'box', 'envelope', 'tube', 'pallet' 
    # + return - OK 
    remote isolated function getContainers(int? isActive = (), string? warehouseIds = (), string? warehouseExternalIds = (), string[]? 'type = ()) returns GetContainersResponse|error {
        string resourcePath = string `/api/v3.1/containers`;
        map<anydata> queryParam = {"isActive": isActive, "warehouseIds": warehouseIds, "warehouseExternalIds": warehouseExternalIds, "type": 'type};
        map<Encoding> queryParamEncoding = {"type": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GetContainersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new container
    #
    # + payload - CreateANewContainer request 
    # + return - OK 
    remote isolated function postContainers(CreateANewContainerRequest payload) returns CreateANewContainerResponse|error {
        string resourcePath = string `/api/v3.1/containers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateANewContainerResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a container
    #
    # + id - The container's id or external id. 
    # + return - OK 
    remote isolated function getContainersById(string id) returns GetAContainerResponse|error {
        string resourcePath = string `/api/v3.1/containers/${getEncodedUri(id)}`;
        GetAContainerResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a container
    #
    # + id - The containers's id or external id. 
    # + payload - UpdateAContainer request 
    # + return - OK 
    remote isolated function putContainersById(string id, UpdateAContainerRequest payload) returns UpdateAContainerResponse|error {
        string resourcePath = string `/api/v3.1/containers/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateAContainerResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
}
