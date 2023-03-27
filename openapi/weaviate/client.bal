// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# Cloud-native, modular vector search engine
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "/v1") returns error? {
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
    # Get a list of Objects.
    #
    # + after - The starting ID of the result window. 
    # + offset - The starting index of the result window. Default value is 0. 
    # + 'limit - The maximum number of items to be returned per page. Default value is set in Weaviate config. 
    # + include - Include additional information, such as classification infos. Allowed values include: classification, vector, interpretation 
    # + sort - Sort parameter to pass an information about the names of the sort fields 
    # + 'order - Order parameter to tell how to order (asc or desc) data within given field 
    # + 'class - Class parameter specifies the class from which to query objects 
    # + return - Successful response. 
    @display {label: "List Objects"}
    resource isolated function get objects(string? after = (), int offset = 0, int? 'limit = (), string? include = (), string? sort = (), string? 'order = (), string? 'class = ()) returns ObjectsListResponse|error {
        string resourcePath = string `/objects`;
        map<anydata> queryParam = {"after": after, "offset": offset, "limit": 'limit, "include": include, "sort": sort, "order": 'order, "class": 'class};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ObjectsListResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Objects between two Objects (object and subject).
    #
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + return - Object created. 
    @display {label: "Insert Object"}
    resource isolated function post objects(Object payload, string? consistency_level = ()) returns Object|error {
        string resourcePath = string `/objects`;
        map<anydata> queryParam = {"consistency_level": consistency_level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Object response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a specific Object based on its class and UUID. Also available as Websocket bus.
    #
    # + id - Unique ID of the Object. 
    # + include - Include additional information, such as classification infos. Allowed values include: classification, vector, interpretation 
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + node_name - The target node which should fulfill the request 
    # + return - Successful response. 
    @display {label: "Get Object by ID"}
    resource isolated function get objects/[string className]/[string id](string? include = (), string? consistency_level = (), string? node_name = ()) returns Object|error {
        string resourcePath = string `/objects/${getEncodedUri(className)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"include": include, "consistency_level": consistency_level, "node_name": node_name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Object response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a class object based on its uuid
    #
    # + id - The uuid of the data object to update. 
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + return - Successfully received. 
    @display {label: "Update Object by ID"}
    resource isolated function put objects/[string className]/[string id](Object payload, string? consistency_level = ()) returns Object|error {
        string resourcePath = string `/objects/${getEncodedUri(className)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"consistency_level": consistency_level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Object response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete object based on its class and UUID.
    #
    # + id - Unique ID of the Object. 
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + return - Successfully deleted. 
    @display {label: "Delete Object by ID"}
    resource isolated function delete objects/[string className]/[string id](string? consistency_level = ()) returns http:Response|error {
        string resourcePath = string `/objects/${getEncodedUri(className)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"consistency_level": consistency_level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update an Object based on its UUID (using patch semantics).
    #
    # + className - The class name as defined in the schema 
    # + id - The uuid of the data object to update. 
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + payload - RFC 7396-style patch, the body contains the object to merge into the existing object. 
    # + return - Successfully applied. No content provided. 
    @display {label: "Patch Object by ID"}
    resource isolated function patch objects/[string className]/[string id](Object payload, string? consistency_level = ()) returns http:Response|error {
        string resourcePath = string `/objects/${getEncodedUri(className)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"consistency_level": consistency_level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Checks object's existence based on its class and uuid.
    #
    # + className - The class name as defined in the schema 
    # + id - The uuid of the data object 
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + return - Object exists. 
    @display {label: "Search Object by ID"}
    resource isolated function head objects/[string className]/[string id](string? consistency_level = ()) returns http:Response|error {
        string resourcePath = string `/objects/${getEncodedUri(className)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"consistency_level": consistency_level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    # Validate an Object based on a schema.
    #
    # + return - Successfully validated. 
    @display {label: "Validate Object"}
    resource isolated function post objects/validate(Object payload) returns http:Response|error {
        string resourcePath = string `/objects/validate`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates new Objects based on a Object template as a batch.
    #
    # + consistency_level - Determines how many replicas must acknowledge a request before it is considered successful 
    # + return - Request succeeded, see response body to get detailed information about each batched item. 
    @display {label: "Insert Objects (Batch)"}
    resource isolated function post batch/objects(Batch_objects_body payload, string? consistency_level = ()) returns ObjectsGetResponse[]|error {
        string resourcePath = string `/batch/objects`;
        map<anydata> queryParam = {"consistency_level": consistency_level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ObjectsGetResponse[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a response based on GraphQL
    #
    # + payload - The GraphQL query request parameters. 
    # + return - Successful query (with select). 
    @display {label: "Query"}
    resource isolated function post graphql(GraphQLQuery payload) returns GraphQLResponse|error {
        string resourcePath = string `/graphql`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GraphQLResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a response based on GraphQL.
    #
    # + payload - The GraphQL queries. 
    # + return - Successful query (with select). 
    @display {label: "Batch Query"}
    resource isolated function post graphql/batch(GraphQLQueries payload) returns GraphQLResponses|error {
        string resourcePath = string `/graphql/batch`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GraphQLResponses response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Dump the current the database schema.
    #
    # + return - Successfully dumped the database schema. 
    @display {label: "Dump DB Schema"}
    resource isolated function get schema() returns Schema|error {
        string resourcePath = string `/schema`;
        Schema response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new Object class in the schema.
    #
    # + return - Added the new Object class to the schema. 
    @display {label: "Create Class"}
    resource isolated function post schema(Class payload) returns Class|error {
        string resourcePath = string `/schema`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Class response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a single class from the schema
    #
    # + return - Found the Class, returned as body 
    @display {label: "Get Class"}
    resource isolated function get schema/[string className]() returns Class|error {
        string resourcePath = string `/schema/${getEncodedUri(className)}`;
        Class response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update settings of an existing schema class
    #
    # + return - Class was updated successfully 
    @display {label: "Update Class"}
    resource isolated function put schema/[string className](Class payload) returns Class|error {
        string resourcePath = string `/schema/${getEncodedUri(className)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Class response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove an Object class (and all data in the instances) from the schema.
    #
    # + return - Removed the Object class from the schema. 
    @display {label: "Delete Class"}
    resource isolated function delete schema/[string className](boolean? force = ()) returns http:Response|error {
        string resourcePath = string `/schema/${getEncodedUri(className)}`;
        map<anydata> queryParam = {"force": force};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add a property to an Object class.
    #
    # + return - Added the property. 
    @display {label: "Add Property"}
    resource isolated function post schema/[string className]/properties(Property payload) returns Property|error {
        string resourcePath = string `/schema/${getEncodedUri(className)}/properties`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Property response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
