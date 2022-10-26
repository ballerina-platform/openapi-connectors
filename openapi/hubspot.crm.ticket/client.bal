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

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
@display {label: "HubSpot CRM Ticket", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com") returns error? {
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
    # List
    #
    # + 'limit - The maximum number of results to display per page. 
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored. 
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored. 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getPage(int 'limit = 10, string? after = (), string[]? properties = (), string[]? associations = (), boolean archived = false) returns SimplePublicObjectWithAssociationsArray|error {
        string resourcePath = string `/crm/v3/objects/tickets`;
        map<anydata> queryParam = {"limit": 'limit, "after": after, "properties": properties, "associations": associations, "archived": archived};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "associations": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SimplePublicObjectWithAssociationsArray response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create
    #
    # + payload - Ticket data 
    # + return - successful operation 
    remote isolated function create(SimplePublicObjectInput payload) returns SimplePublicObject|error {
        string resourcePath = string `/crm/v3/objects/tickets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObject response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Archive a batch of tickets by ID
    #
    # + payload - Record containing an array of ticket IDs 
    # + return - No content 
    remote isolated function batchArchive(SimplePublicObjectIdArray payload) returns http:Response|error {
        string resourcePath = string `/crm/v3/objects/tickets/batch/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a batch of tickets
    #
    # + payload - Record with an array of ticket data 
    # + return - successful operation 
    remote isolated function batchCreate(SimplePublicObjectInputArray payload) returns SimplePublicObjectBatchWithErrors|SimplePublicObjectBatch|error {
        string resourcePath = string `/crm/v3/objects/tickets/batch/create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObjectBatchWithErrors|SimplePublicObjectBatch response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read a batch of tickets by internal ID, or unique property values
    #
    # + archived - Whether to return only results that have been archived. 
    # + payload - Object which contains array of internal IDs of tickets 
    # + return - successful operation 
    remote isolated function batchRead(SimplePublicObjectIdReadArray payload, boolean archived = false) returns SimplePublicObjectBatchWithErrors|SimplePublicObjectBatch|error {
        string resourcePath = string `/crm/v3/objects/tickets/batch/read`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObjectBatchWithErrors|SimplePublicObjectBatch response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update a batch of tickets
    #
    # + payload - Record with array of updated ticket data 
    # + return - successful operation 
    remote isolated function batchUpdate(SimplePublicObjectArray payload) returns SimplePublicObjectBatchWithErrors|SimplePublicObjectBatch|error {
        string resourcePath = string `/crm/v3/objects/tickets/batch/update`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObjectBatchWithErrors|SimplePublicObjectBatch response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Filter, Sort, and Search CRM Objects
    #
    # + payload - Ticket search request 
    # + return - successful operation 
    remote isolated function doSearch(PublicObjectSearchRequest payload) returns SimplePublicObjectWithForwardPaging|error {
        string resourcePath = string `/crm/v3/objects/tickets/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObjectWithForwardPaging response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read
    #
    # + ticketId - Ticket ID 
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored. 
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored. 
    # + archived - Whether to return only results that have been archived. 
    # + idProperty - The name of a property whose values are unique for this object type 
    # + return - successful operation 
    remote isolated function getObjectById(string ticketId, string[]? properties = (), string[]? associations = (), boolean archived = false, string? idProperty = ()) returns SimplePublicObjectWithAssociations|error {
        string resourcePath = string `/crm/v3/objects/tickets/${getEncodedUri(ticketId)}`;
        map<anydata> queryParam = {"properties": properties, "associations": associations, "archived": archived, "idProperty": idProperty};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "associations": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SimplePublicObjectWithAssociations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Archive
    #
    # + ticketId - Ticket ID 
    # + return - No content 
    remote isolated function archive(string ticketId) returns http:Response|error {
        string resourcePath = string `/crm/v3/objects/tickets/${getEncodedUri(ticketId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update
    #
    # + ticketId - Ticket ID 
    # + idProperty - The name of a property whose values are unique for this object type 
    # + payload - Attributes to update in ticket 
    # + return - successful operation 
    remote isolated function update(string ticketId, SimplePublicObjectInput payload, string? idProperty = ()) returns SimplePublicObject|error {
        string resourcePath = string `/crm/v3/objects/tickets/${getEncodedUri(ticketId)}`;
        map<anydata> queryParam = {"idProperty": idProperty};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObject response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List associations of a ticket by type
    #
    # + ticketId - Ticket ID 
    # + toObjectType - Object type to associate with 
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + return - successful operation 
    remote isolated function associationsGetAll(string ticketId, string toObjectType, string? after = (), int 'limit = 500) returns AssociatedIdArrayWithForwardPaging|error {
        string resourcePath = string `/crm/v3/objects/tickets/${getEncodedUri(ticketId)}/associations/${getEncodedUri(toObjectType)}`;
        map<anydata> queryParam = {"after": after, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AssociatedIdArrayWithForwardPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Associate a ticket with another object
    #
    # + ticketId - Ticket ID 
    # + toObjectType - Object type to associate with 
    # + toObjectId - Object ID to associate 
    # + associationType - Type of the association 
    # + return - successful operation 
    remote isolated function associationsCreate(string ticketId, string toObjectType, string toObjectId, string associationType) returns SimplePublicObjectWithAssociations|error {
        string resourcePath = string `/crm/v3/objects/tickets/${getEncodedUri(ticketId)}/associations/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}/${getEncodedUri(associationType)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        SimplePublicObjectWithAssociations response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Remove an association between two tickets
    #
    # + ticketId - Ticket ID 
    # + toObjectType - Object type to associate with 
    # + toObjectId - Object ID to associate 
    # + associationType - Type of the association 
    # + return - No content 
    remote isolated function associationsArchive(string ticketId, string toObjectType, string toObjectId, string associationType) returns http:Response|error {
        string resourcePath = string `/crm/v3/objects/tickets/${getEncodedUri(ticketId)}/associations/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}/${getEncodedUri(associationType)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
