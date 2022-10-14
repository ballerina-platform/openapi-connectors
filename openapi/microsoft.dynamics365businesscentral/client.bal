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
    http:BearerTokenConfig auth;
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

# This is a generated connector from [Microsoft Dynamics 365 Business Central API v1.0](https://dynamics.microsoft.com/en-us/business-central/overview/) OpenAPI specification.
# (v1.0) Business Central Standard APIs
@display {label: "Microsoft Dynamics 365 Business Central", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Dynamics 365 Business Central Account](https://dynamics.microsoft.com/en-us/business-central/overview/) and obtain tokens following [this guide](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-develop-connect-apps#AAD).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.businesscentral.dynamics.com/v2.0/sandbox/api/v1.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a list of companies
    #
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of companies 
    remote isolated function listCompanies(int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse200|error {
        string resourcePath = string `/companies`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type company for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested company 
    remote isolated function getCompany(string companyId, string[]? 'select = ()) returns Company|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Company response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of items
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of items 
    remote isolated function listItems(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2001|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type item in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new item has been succesfully created 
    remote isolated function postItem(string companyId, string contentType, json payload) returns Item|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Item response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type item for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested item 
    remote isolated function getItem(string companyId, string itemId, string[]? expand = (), string[]? 'select = ()) returns Item|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Item response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type item in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + return - (v1.0) Succesfully deleted the specified item 
    remote isolated function deleteItem(string companyId, string itemId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type item in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieditem 
    remote isolated function patchItem(string companyId, string itemId, string contentType, string ifMatch, json payload) returns Item|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Item response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of picture
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of picture 
    remote isolated function listPictureForItem(string companyId, string itemId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2002|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/picture`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type picture for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + pictureId - (v1.0) id for picture 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested picture 
    remote isolated function getPictureForItem(string companyId, string itemId, string pictureId, string[]? 'select = ()) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/picture(${getEncodedUri(pictureId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Picture response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + pictureId - (v1.0) id for picture 
    # + return - (v1.0) Succesfully deleted the specified picture 
    remote isolated function deletePictureForItem(string companyId, string itemId, string pictureId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/picture(${getEncodedUri(pictureId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + pictureId - (v1.0) id for picture 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpicture 
    remote isolated function patchPictureForItem(string companyId, string itemId, string pictureId, string contentType, string ifMatch, json payload) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/picture(${getEncodedUri(pictureId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Picture response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of defaultDimensions
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of defaultDimensions 
    remote isolated function listDefaultDimensionsForItem(string companyId, string itemId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2003|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/defaultDimensions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new defaultDimensions has been succesfully created 
    remote isolated function postDefaultDimensionsForItem(string companyId, string itemId, string contentType, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/defaultDimensions`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type defaultDimensions for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested defaultDimensions 
    remote isolated function getDefaultDimensionsForItem(string companyId, string itemId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string[]? expand = (), string[]? 'select = ()) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DefaultDimensions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + return - (v1.0) Succesfully deleted the specified defaultDimensions 
    remote isolated function deleteDefaultDimensionsForItem(string companyId, string itemId, string defaultdimensionsParentid, string defaultdimensionsDimensionid) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemId - (v1.0) id for item 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieddefaultDimensions 
    remote isolated function patchDefaultDimensionsForItem(string companyId, string itemId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string contentType, string ifMatch, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/items(${getEncodedUri(itemId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of picture
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of picture 
    remote isolated function listPicture(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2002|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/picture`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type picture for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + pictureId - (v1.0) id for picture 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested picture 
    remote isolated function getPicture(string companyId, string pictureId, string[]? 'select = ()) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/picture(${getEncodedUri(pictureId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Picture response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + pictureId - (v1.0) id for picture 
    # + return - (v1.0) Succesfully deleted the specified picture 
    remote isolated function deletePicture(string companyId, string pictureId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/picture(${getEncodedUri(pictureId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + pictureId - (v1.0) id for picture 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpicture 
    remote isolated function patchPicture(string companyId, string pictureId, string contentType, string ifMatch, json payload) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/picture(${getEncodedUri(pictureId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Picture response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of defaultDimensions
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of defaultDimensions 
    remote isolated function listDefaultDimensions(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2003|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/defaultDimensions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new defaultDimensions has been succesfully created 
    remote isolated function postDefaultDimensions(string companyId, string contentType, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/defaultDimensions`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type defaultDimensions for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested defaultDimensions 
    remote isolated function getDefaultDimensions(string companyId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string[]? expand = (), string[]? 'select = ()) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DefaultDimensions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + return - (v1.0) Succesfully deleted the specified defaultDimensions 
    remote isolated function deleteDefaultDimensions(string companyId, string defaultdimensionsParentid, string defaultdimensionsDimensionid) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieddefaultDimensions 
    remote isolated function patchDefaultDimensions(string companyId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string contentType, string ifMatch, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of customers
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customers 
    remote isolated function listCustomers(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2004|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type customer in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new customer has been succesfully created 
    remote isolated function postCustomer(string companyId, string contentType, json payload) returns Customer|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customer for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customer 
    remote isolated function getCustomer(string companyId, string customerId, string[]? expand = (), string[]? 'select = ()) returns Customer|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type customer in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + return - (v1.0) Succesfully deleted the specified customer 
    remote isolated function deleteCustomer(string companyId, string customerId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type customer in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcustomer 
    remote isolated function patchCustomer(string companyId, string customerId, string contentType, string ifMatch, json payload) returns Customer|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of customerFinancialDetails
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customerFinancialDetails 
    remote isolated function listCustomerFinancialDetailsForCustomer(string companyId, string customerId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2005|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/customerFinancialDetails`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customerFinancialDetail for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + customerfinancialdetailId - (v1.0) id for customerFinancialDetail 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customerFinancialDetail 
    remote isolated function getCustomerFinancialDetailForCustomer(string companyId, string customerId, string customerfinancialdetailId, string[]? 'select = ()) returns CustomerFinancialDetail|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/customerFinancialDetails(${getEncodedUri(customerfinancialdetailId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerFinancialDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of picture
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of picture 
    remote isolated function listPictureForCustomer(string companyId, string customerId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2002|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/picture`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type picture for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + pictureId - (v1.0) id for picture 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested picture 
    remote isolated function getPictureForCustomer(string companyId, string customerId, string pictureId, string[]? 'select = ()) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/picture(${getEncodedUri(pictureId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Picture response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + pictureId - (v1.0) id for picture 
    # + return - (v1.0) Succesfully deleted the specified picture 
    remote isolated function deletePictureForCustomer(string companyId, string customerId, string pictureId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/picture(${getEncodedUri(pictureId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + pictureId - (v1.0) id for picture 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpicture 
    remote isolated function patchPictureForCustomer(string companyId, string customerId, string pictureId, string contentType, string ifMatch, json payload) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/picture(${getEncodedUri(pictureId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Picture response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of defaultDimensions
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of defaultDimensions 
    remote isolated function listDefaultDimensionsForCustomer(string companyId, string customerId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2003|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/defaultDimensions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new defaultDimensions has been succesfully created 
    remote isolated function postDefaultDimensionsForCustomer(string companyId, string customerId, string contentType, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/defaultDimensions`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type defaultDimensions for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested defaultDimensions 
    remote isolated function getDefaultDimensionsForCustomer(string companyId, string customerId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string[]? expand = (), string[]? 'select = ()) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DefaultDimensions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + return - (v1.0) Succesfully deleted the specified defaultDimensions 
    remote isolated function deleteDefaultDimensionsForCustomer(string companyId, string customerId, string defaultdimensionsParentid, string defaultdimensionsDimensionid) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerId - (v1.0) id for customer 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieddefaultDimensions 
    remote isolated function patchDefaultDimensionsForCustomer(string companyId, string customerId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string contentType, string ifMatch, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customers(${getEncodedUri(customerId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of customerFinancialDetails
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customerFinancialDetails 
    remote isolated function listCustomerFinancialDetails(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2005|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerFinancialDetails`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customerFinancialDetail for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerfinancialdetailId - (v1.0) id for customerFinancialDetail 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customerFinancialDetail 
    remote isolated function getCustomerFinancialDetail(string companyId, string customerfinancialdetailId, string[]? 'select = ()) returns CustomerFinancialDetail|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerFinancialDetails(${getEncodedUri(customerfinancialdetailId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerFinancialDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of vendors
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of vendors 
    remote isolated function listVendors(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2006|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2006 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type vendor in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new vendor has been succesfully created 
    remote isolated function postVendor(string companyId, string contentType, json payload) returns Vendor|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Vendor response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type vendor for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested vendor 
    remote isolated function getVendor(string companyId, string vendorId, string[]? expand = (), string[]? 'select = ()) returns Vendor|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Vendor response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type vendor in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + return - (v1.0) Succesfully deleted the specified vendor 
    remote isolated function deleteVendor(string companyId, string vendorId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type vendor in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedvendor 
    remote isolated function patchVendor(string companyId, string vendorId, string contentType, string ifMatch, json payload) returns Vendor|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Vendor response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of picture
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of picture 
    remote isolated function listPictureForVendor(string companyId, string vendorId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2002|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/picture`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type picture for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + pictureId - (v1.0) id for picture 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested picture 
    remote isolated function getPictureForVendor(string companyId, string vendorId, string pictureId, string[]? 'select = ()) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/picture(${getEncodedUri(pictureId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Picture response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + pictureId - (v1.0) id for picture 
    # + return - (v1.0) Succesfully deleted the specified picture 
    remote isolated function deletePictureForVendor(string companyId, string vendorId, string pictureId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/picture(${getEncodedUri(pictureId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + pictureId - (v1.0) id for picture 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpicture 
    remote isolated function patchPictureForVendor(string companyId, string vendorId, string pictureId, string contentType, string ifMatch, json payload) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/picture(${getEncodedUri(pictureId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Picture response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of defaultDimensions
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of defaultDimensions 
    remote isolated function listDefaultDimensionsForVendor(string companyId, string vendorId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2003|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/defaultDimensions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new defaultDimensions has been succesfully created 
    remote isolated function postDefaultDimensionsForVendor(string companyId, string vendorId, string contentType, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/defaultDimensions`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type defaultDimensions for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested defaultDimensions 
    remote isolated function getDefaultDimensionsForVendor(string companyId, string vendorId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string[]? expand = (), string[]? 'select = ()) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DefaultDimensions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + return - (v1.0) Succesfully deleted the specified defaultDimensions 
    remote isolated function deleteDefaultDimensionsForVendor(string companyId, string vendorId, string defaultdimensionsParentid, string defaultdimensionsDimensionid) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + vendorId - (v1.0) id for vendor 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieddefaultDimensions 
    remote isolated function patchDefaultDimensionsForVendor(string companyId, string vendorId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string contentType, string ifMatch, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendors(${getEncodedUri(vendorId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of companyInformation
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of companyInformation 
    remote isolated function listCompanyInformation(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2007|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/companyInformation`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type companyInformation for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + companyinformationId - (v1.0) id for companyInformation 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested companyInformation 
    remote isolated function getCompanyInformation(string companyId, string companyinformationId, string[]? 'select = ()) returns CompanyInformation|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/companyInformation(${getEncodedUri(companyinformationId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CompanyInformation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an object of type companyInformation in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + companyinformationId - (v1.0) id for companyInformation 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcompanyInformation 
    remote isolated function patchCompanyInformation(string companyId, string companyinformationId, string contentType, string ifMatch, json payload) returns CompanyInformation|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/companyInformation(${getEncodedUri(companyinformationId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CompanyInformation response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of salesInvoices
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesInvoices 
    remote isolated function listSalesInvoices(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2008|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2008 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesInvoice in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesInvoice has been succesfully created 
    remote isolated function postSalesInvoice(string companyId, string contentType, json payload) returns SalesInvoice|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesInvoice response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesInvoice for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesInvoice 
    remote isolated function getSalesInvoice(string companyId, string salesinvoiceId, string[]? expand = (), string[]? 'select = ()) returns SalesInvoice|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesInvoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesInvoice in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully deleted the specified salesInvoice 
    remote isolated function deleteSalesInvoice(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesInvoice in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesInvoice 
    remote isolated function patchSalesInvoice(string companyId, string salesinvoiceId, string contentType, string ifMatch, json payload) returns SalesInvoice|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesInvoice response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Performs the cancelAndSend action for salesInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully performed a cancelAndSend action on the Dynamic 365 Business Central salesInvoices entity 
    remote isolated function cancelAndSendActionSalesInvoices(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/Microsoft.NAV.cancelAndSend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the cancel action for salesInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully performed a cancel action on the Dynamic 365 Business Central salesInvoices entity 
    remote isolated function cancelActionSalesInvoices(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/Microsoft.NAV.cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the makeCorrectiveCreditMemo action for salesInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully performed a makeCorrectiveCreditMemo action on the Dynamic 365 Business Central salesInvoices entity 
    remote isolated function makeCorrectiveCreditMemoActionSalesInvoices(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/Microsoft.NAV.makeCorrectiveCreditMemo`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the postAndSend action for salesInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully performed a postAndSend action on the Dynamic 365 Business Central salesInvoices entity 
    remote isolated function postAndSendActionSalesInvoices(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/Microsoft.NAV.postAndSend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the post action for salesInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully performed a post action on the Dynamic 365 Business Central salesInvoices entity 
    remote isolated function postActionSalesInvoices(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/Microsoft.NAV.post`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the send action for salesInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + return - (v1.0) Succesfully performed a send action on the Dynamic 365 Business Central salesInvoices entity 
    remote isolated function sendActionSalesInvoices(string companyId, string salesinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/Microsoft.NAV.send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of salesInvoiceLines
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesInvoiceLines 
    remote isolated function listSalesInvoiceLinesForSalesInvoice(string companyId, string salesinvoiceId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2009|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/salesInvoiceLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2009 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesInvoiceLine has been succesfully created 
    remote isolated function postSalesInvoiceLineForSalesInvoice(string companyId, string salesinvoiceId, string contentType, json payload) returns SalesInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/salesInvoiceLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesInvoiceLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesInvoiceLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + salesinvoicelineId - (v1.0) id for salesInvoiceLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesInvoiceLine 
    remote isolated function getSalesInvoiceLineForSalesInvoice(string companyId, string salesinvoiceId, string salesinvoicelineId, string[]? expand = (), string[]? 'select = ()) returns SalesInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/salesInvoiceLines('${getEncodedUri(salesinvoicelineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesInvoiceLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + salesinvoicelineId - (v1.0) id for salesInvoiceLine 
    # + return - (v1.0) Succesfully deleted the specified salesInvoiceLine 
    remote isolated function deleteSalesInvoiceLineForSalesInvoice(string companyId, string salesinvoiceId, string salesinvoicelineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/salesInvoiceLines('${getEncodedUri(salesinvoicelineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + salesinvoicelineId - (v1.0) id for salesInvoiceLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesInvoiceLine 
    remote isolated function patchSalesInvoiceLineForSalesInvoice(string companyId, string salesinvoiceId, string salesinvoicelineId, string contentType, string ifMatch, json payload) returns SalesInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/salesInvoiceLines('${getEncodedUri(salesinvoicelineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesInvoiceLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of pdfDocument
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of pdfDocument 
    remote isolated function listPdfDocumentForSalesInvoice(string companyId, string salesinvoiceId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20010|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/pdfDocument`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type pdfDocument for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoiceId - (v1.0) id for salesInvoice 
    # + pdfdocumentId - (v1.0) id for pdfDocument 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested pdfDocument 
    remote isolated function getPdfDocumentForSalesInvoice(string companyId, string salesinvoiceId, string pdfdocumentId, string[]? 'select = ()) returns PdfDocument|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoices(${getEncodedUri(salesinvoiceId)})/pdfDocument(${getEncodedUri(pdfdocumentId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PdfDocument response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of salesInvoiceLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesInvoiceLines 
    remote isolated function listSalesInvoiceLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2009|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoiceLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2009 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesInvoiceLine has been succesfully created 
    remote isolated function postSalesInvoiceLine(string companyId, string contentType, json payload) returns SalesInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoiceLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesInvoiceLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesInvoiceLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoicelineId - (v1.0) id for salesInvoiceLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesInvoiceLine 
    remote isolated function getSalesInvoiceLine(string companyId, string salesinvoicelineId, string[]? expand = (), string[]? 'select = ()) returns SalesInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoiceLines('${getEncodedUri(salesinvoicelineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesInvoiceLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoicelineId - (v1.0) id for salesInvoiceLine 
    # + return - (v1.0) Succesfully deleted the specified salesInvoiceLine 
    remote isolated function deleteSalesInvoiceLine(string companyId, string salesinvoicelineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoiceLines('${getEncodedUri(salesinvoicelineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesinvoicelineId - (v1.0) id for salesInvoiceLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesInvoiceLine 
    remote isolated function patchSalesInvoiceLine(string companyId, string salesinvoicelineId, string contentType, string ifMatch, json payload) returns SalesInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesInvoiceLines('${getEncodedUri(salesinvoicelineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesInvoiceLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of pdfDocument
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of pdfDocument 
    remote isolated function listPdfDocument(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20010|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/pdfDocument`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type pdfDocument for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + pdfdocumentId - (v1.0) id for pdfDocument 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested pdfDocument 
    remote isolated function getPdfDocument(string companyId, string pdfdocumentId, string[]? 'select = ()) returns PdfDocument|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/pdfDocument(${getEncodedUri(pdfdocumentId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PdfDocument response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of customerPaymentJournals
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customerPaymentJournals 
    remote isolated function listCustomerPaymentJournals(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20011|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20011 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type customerPaymentJournal in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new customerPaymentJournal has been succesfully created 
    remote isolated function postCustomerPaymentJournal(string companyId, string contentType, json payload) returns CustomerPaymentJournal|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerPaymentJournal response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customerPaymentJournal for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customerPaymentJournal 
    remote isolated function getCustomerPaymentJournal(string companyId, string customerpaymentjournalId, string[]? expand = (), string[]? 'select = ()) returns CustomerPaymentJournal|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerPaymentJournal response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type customerPaymentJournal in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + return - (v1.0) Succesfully deleted the specified customerPaymentJournal 
    remote isolated function deleteCustomerPaymentJournal(string companyId, string customerpaymentjournalId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type customerPaymentJournal in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcustomerPaymentJournal 
    remote isolated function patchCustomerPaymentJournal(string companyId, string customerpaymentjournalId, string contentType, string ifMatch, json payload) returns CustomerPaymentJournal|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerPaymentJournal response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of customerPayments
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customerPayments 
    remote isolated function listCustomerPaymentsForCustomerPaymentJournal(string companyId, string customerpaymentjournalId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20012|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})/customerPayments`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20012 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type customerPayment in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new customerPayment has been succesfully created 
    remote isolated function postCustomerPaymentForCustomerPaymentJournal(string companyId, string customerpaymentjournalId, string contentType, json payload) returns CustomerPayment|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})/customerPayments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerPayment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customerPayment for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + customerpaymentId - (v1.0) id for customerPayment 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customerPayment 
    remote isolated function getCustomerPaymentForCustomerPaymentJournal(string companyId, string customerpaymentjournalId, string customerpaymentId, string[]? expand = (), string[]? 'select = ()) returns CustomerPayment|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})/customerPayments(${getEncodedUri(customerpaymentId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerPayment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type customerPayment in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + customerpaymentId - (v1.0) id for customerPayment 
    # + return - (v1.0) Succesfully deleted the specified customerPayment 
    remote isolated function deleteCustomerPaymentForCustomerPaymentJournal(string companyId, string customerpaymentjournalId, string customerpaymentId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})/customerPayments(${getEncodedUri(customerpaymentId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type customerPayment in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentjournalId - (v1.0) id for customerPaymentJournal 
    # + customerpaymentId - (v1.0) id for customerPayment 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcustomerPayment 
    remote isolated function patchCustomerPaymentForCustomerPaymentJournal(string companyId, string customerpaymentjournalId, string customerpaymentId, string contentType, string ifMatch, json payload) returns CustomerPayment|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPaymentJournals(${getEncodedUri(customerpaymentjournalId)})/customerPayments(${getEncodedUri(customerpaymentId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerPayment response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of customerPayments
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customerPayments 
    remote isolated function listCustomerPayments(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20012|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPayments`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20012 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type customerPayment in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new customerPayment has been succesfully created 
    remote isolated function postCustomerPayment(string companyId, string contentType, json payload) returns CustomerPayment|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPayments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerPayment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customerPayment for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentId - (v1.0) id for customerPayment 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customerPayment 
    remote isolated function getCustomerPayment(string companyId, string customerpaymentId, string[]? expand = (), string[]? 'select = ()) returns CustomerPayment|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPayments(${getEncodedUri(customerpaymentId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerPayment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type customerPayment in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentId - (v1.0) id for customerPayment 
    # + return - (v1.0) Succesfully deleted the specified customerPayment 
    remote isolated function deleteCustomerPayment(string companyId, string customerpaymentId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPayments(${getEncodedUri(customerpaymentId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type customerPayment in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + customerpaymentId - (v1.0) id for customerPayment 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcustomerPayment 
    remote isolated function patchCustomerPayment(string companyId, string customerpaymentId, string contentType, string ifMatch, json payload) returns CustomerPayment|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerPayments(${getEncodedUri(customerpaymentId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerPayment response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of accounts
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of accounts 
    remote isolated function listAccounts(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20013|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/accounts`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20013 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type account for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + accountId - (v1.0) id for account 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested account 
    remote isolated function getAccount(string companyId, string accountId, string[]? 'select = ()) returns Account|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/accounts(${getEncodedUri(accountId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of taxGroups
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of taxGroups 
    remote isolated function listTaxGroups(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20014|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxGroups`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20014 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type taxGroup in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new taxGroup has been succesfully created 
    remote isolated function postTaxGroup(string companyId, string contentType, json payload) returns TaxGroup|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxGroups`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxGroup response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type taxGroup for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + taxgroupId - (v1.0) id for taxGroup 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested taxGroup 
    remote isolated function getTaxGroup(string companyId, string taxgroupId, string[]? 'select = ()) returns TaxGroup|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxGroups(${getEncodedUri(taxgroupId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type taxGroup in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + taxgroupId - (v1.0) id for taxGroup 
    # + return - (v1.0) Succesfully deleted the specified taxGroup 
    remote isolated function deleteTaxGroup(string companyId, string taxgroupId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxGroups(${getEncodedUri(taxgroupId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type taxGroup in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + taxgroupId - (v1.0) id for taxGroup 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedtaxGroup 
    remote isolated function patchTaxGroup(string companyId, string taxgroupId, string contentType, string ifMatch, json payload) returns TaxGroup|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxGroups(${getEncodedUri(taxgroupId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxGroup response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of journals
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of journals 
    remote isolated function listJournals(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20015|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20015 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type journal in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new journal has been succesfully created 
    remote isolated function postJournal(string companyId, string contentType, json payload) returns Journal|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Journal response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type journal for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested journal 
    remote isolated function getJournal(string companyId, string journalId, string[]? expand = (), string[]? 'select = ()) returns Journal|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Journal response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type journal in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + return - (v1.0) Succesfully deleted the specified journal 
    remote isolated function deleteJournal(string companyId, string journalId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type journal in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedjournal 
    remote isolated function patchJournal(string companyId, string journalId, string contentType, string ifMatch, json payload) returns Journal|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Journal response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Performs the post action for journals entity
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + return - (v1.0) Succesfully performed a post action on the Dynamic 365 Business Central journals entity 
    remote isolated function postActionJournals(string companyId, string journalId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/Microsoft.NAV.post`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of journalLines
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of journalLines 
    remote isolated function listJournalLinesForJournal(string companyId, string journalId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20016|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20016 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type journalLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new journalLine has been succesfully created 
    remote isolated function postJournalLineForJournal(string companyId, string journalId, string contentType, json payload) returns JournalLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        JournalLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type journalLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested journalLine 
    remote isolated function getJournalLineForJournal(string companyId, string journalId, string journallineId, string[]? expand = (), string[]? 'select = ()) returns JournalLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        JournalLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type journalLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + return - (v1.0) Succesfully deleted the specified journalLine 
    remote isolated function deleteJournalLineForJournal(string companyId, string journalId, string journallineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type journalLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedjournalLine 
    remote isolated function patchJournalLineForJournal(string companyId, string journalId, string journallineId, string contentType, string ifMatch, json payload) returns JournalLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        JournalLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of attachments
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of attachments 
    remote isolated function listAttachmentsForJournalLineForJournal(string companyId, string journalId, string journallineId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20017|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})/attachments`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20017 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new attachments has been succesfully created 
    remote isolated function postAttachmentsForJournalLineForJournal(string companyId, string journalId, string journallineId, string contentType, json payload) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})/attachments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachments response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type attachments for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested attachments 
    remote isolated function getAttachmentsForJournalLineForJournal(string companyId, string journalId, string journallineId, string attachmentsParentid, string attachmentsId, string[]? 'select = ()) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Attachments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + return - (v1.0) Succesfully deleted the specified attachments 
    remote isolated function deleteAttachmentsForJournalLineForJournal(string companyId, string journalId, string journallineId, string attachmentsParentid, string attachmentsId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journalId - (v1.0) id for journal 
    # + journallineId - (v1.0) id for journalLine 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedattachments 
    remote isolated function patchAttachmentsForJournalLineForJournal(string companyId, string journalId, string journallineId, string attachmentsParentid, string attachmentsId, string contentType, string ifMatch, json payload) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journals(${getEncodedUri(journalId)})/journalLines(${getEncodedUri(journallineId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachments response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of journalLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of journalLines 
    remote isolated function listJournalLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20016|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20016 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type journalLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new journalLine has been succesfully created 
    remote isolated function postJournalLine(string companyId, string contentType, json payload) returns JournalLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        JournalLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type journalLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested journalLine 
    remote isolated function getJournalLine(string companyId, string journallineId, string[]? expand = (), string[]? 'select = ()) returns JournalLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        JournalLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type journalLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + return - (v1.0) Succesfully deleted the specified journalLine 
    remote isolated function deleteJournalLine(string companyId, string journallineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type journalLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedjournalLine 
    remote isolated function patchJournalLine(string companyId, string journallineId, string contentType, string ifMatch, json payload) returns JournalLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        JournalLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of attachments
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of attachments 
    remote isolated function listAttachmentsForJournalLine(string companyId, string journallineId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20017|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})/attachments`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20017 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new attachments has been succesfully created 
    remote isolated function postAttachmentsForJournalLine(string companyId, string journallineId, string contentType, json payload) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})/attachments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachments response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type attachments for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested attachments 
    remote isolated function getAttachmentsForJournalLine(string companyId, string journallineId, string attachmentsParentid, string attachmentsId, string[]? 'select = ()) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Attachments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + return - (v1.0) Succesfully deleted the specified attachments 
    remote isolated function deleteAttachmentsForJournalLine(string companyId, string journallineId, string attachmentsParentid, string attachmentsId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + journallineId - (v1.0) id for journalLine 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedattachments 
    remote isolated function patchAttachmentsForJournalLine(string companyId, string journallineId, string attachmentsParentid, string attachmentsId, string contentType, string ifMatch, json payload) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/journalLines(${getEncodedUri(journallineId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachments response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of attachments
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of attachments 
    remote isolated function listAttachments(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20017|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/attachments`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20017 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new attachments has been succesfully created 
    remote isolated function postAttachments(string companyId, string contentType, json payload) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/attachments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachments response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type attachments for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested attachments 
    remote isolated function getAttachments(string companyId, string attachmentsParentid, string attachmentsId, string[]? 'select = ()) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Attachments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + return - (v1.0) Succesfully deleted the specified attachments 
    remote isolated function deleteAttachments(string companyId, string attachmentsParentid, string attachmentsId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type attachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + attachmentsParentid - (v1.0) parentId for attachments 
    # + attachmentsId - (v1.0) id for attachments 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedattachments 
    remote isolated function patchAttachments(string companyId, string attachmentsParentid, string attachmentsId, string contentType, string ifMatch, json payload) returns Attachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/attachments(${getEncodedUri(attachmentsParentid)},${getEncodedUri(attachmentsId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Attachments response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of employees
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of employees 
    remote isolated function listEmployees(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20018|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20018 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type employee in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new employee has been succesfully created 
    remote isolated function postEmployee(string companyId, string contentType, json payload) returns Employee|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Employee response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type employee for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested employee 
    remote isolated function getEmployee(string companyId, string employeeId, string[]? expand = (), string[]? 'select = ()) returns Employee|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Employee response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type employee in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + return - (v1.0) Succesfully deleted the specified employee 
    remote isolated function deleteEmployee(string companyId, string employeeId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type employee in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedemployee 
    remote isolated function patchEmployee(string companyId, string employeeId, string contentType, string ifMatch, json payload) returns Employee|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Employee response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of picture
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of picture 
    remote isolated function listPictureForEmployee(string companyId, string employeeId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse2002|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/picture`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type picture for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + pictureId - (v1.0) id for picture 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested picture 
    remote isolated function getPictureForEmployee(string companyId, string employeeId, string pictureId, string[]? 'select = ()) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/picture(${getEncodedUri(pictureId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Picture response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + pictureId - (v1.0) id for picture 
    # + return - (v1.0) Succesfully deleted the specified picture 
    remote isolated function deletePictureForEmployee(string companyId, string employeeId, string pictureId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/picture(${getEncodedUri(pictureId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type picture in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + pictureId - (v1.0) id for picture 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpicture 
    remote isolated function patchPictureForEmployee(string companyId, string employeeId, string pictureId, string contentType, string ifMatch, json payload) returns Picture|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/picture(${getEncodedUri(pictureId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Picture response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of defaultDimensions
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of defaultDimensions 
    remote isolated function listDefaultDimensionsForEmployee(string companyId, string employeeId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse2003|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/defaultDimensions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new defaultDimensions has been succesfully created 
    remote isolated function postDefaultDimensionsForEmployee(string companyId, string employeeId, string contentType, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/defaultDimensions`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type defaultDimensions for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested defaultDimensions 
    remote isolated function getDefaultDimensionsForEmployee(string companyId, string employeeId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string[]? expand = (), string[]? 'select = ()) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DefaultDimensions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + return - (v1.0) Succesfully deleted the specified defaultDimensions 
    remote isolated function deleteDefaultDimensionsForEmployee(string companyId, string employeeId, string defaultdimensionsParentid, string defaultdimensionsDimensionid) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type defaultDimensions in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + defaultdimensionsParentid - (v1.0) parentId for defaultDimensions 
    # + defaultdimensionsDimensionid - (v1.0) dimensionId for defaultDimensions 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieddefaultDimensions 
    remote isolated function patchDefaultDimensionsForEmployee(string companyId, string employeeId, string defaultdimensionsParentid, string defaultdimensionsDimensionid, string contentType, string ifMatch, json payload) returns DefaultDimensions|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/defaultDimensions(${getEncodedUri(defaultdimensionsParentid)},${getEncodedUri(defaultdimensionsDimensionid)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DefaultDimensions response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of timeRegistrationEntries
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of timeRegistrationEntries 
    remote isolated function listTimeRegistrationEntriesForEmployee(string companyId, string employeeId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20019|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/timeRegistrationEntries`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20019 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type timeRegistrationEntry in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new timeRegistrationEntry has been succesfully created 
    remote isolated function postTimeRegistrationEntryForEmployee(string companyId, string employeeId, string contentType, json payload) returns TimeRegistrationEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/timeRegistrationEntries`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TimeRegistrationEntry response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type timeRegistrationEntry for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + timeregistrationentryId - (v1.0) id for timeRegistrationEntry 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested timeRegistrationEntry 
    remote isolated function getTimeRegistrationEntryForEmployee(string companyId, string employeeId, string timeregistrationentryId, string[]? expand = (), string[]? 'select = ()) returns TimeRegistrationEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/timeRegistrationEntries(${getEncodedUri(timeregistrationentryId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TimeRegistrationEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type timeRegistrationEntry in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + timeregistrationentryId - (v1.0) id for timeRegistrationEntry 
    # + return - (v1.0) Succesfully deleted the specified timeRegistrationEntry 
    remote isolated function deleteTimeRegistrationEntryForEmployee(string companyId, string employeeId, string timeregistrationentryId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/timeRegistrationEntries(${getEncodedUri(timeregistrationentryId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type timeRegistrationEntry in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + employeeId - (v1.0) id for employee 
    # + timeregistrationentryId - (v1.0) id for timeRegistrationEntry 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedtimeRegistrationEntry 
    remote isolated function patchTimeRegistrationEntryForEmployee(string companyId, string employeeId, string timeregistrationentryId, string contentType, string ifMatch, json payload) returns TimeRegistrationEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/employees(${getEncodedUri(employeeId)})/timeRegistrationEntries(${getEncodedUri(timeregistrationentryId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TimeRegistrationEntry response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of timeRegistrationEntries
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of timeRegistrationEntries 
    remote isolated function listTimeRegistrationEntries(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20019|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/timeRegistrationEntries`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20019 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type timeRegistrationEntry in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new timeRegistrationEntry has been succesfully created 
    remote isolated function postTimeRegistrationEntry(string companyId, string contentType, json payload) returns TimeRegistrationEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/timeRegistrationEntries`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TimeRegistrationEntry response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type timeRegistrationEntry for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + timeregistrationentryId - (v1.0) id for timeRegistrationEntry 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested timeRegistrationEntry 
    remote isolated function getTimeRegistrationEntry(string companyId, string timeregistrationentryId, string[]? expand = (), string[]? 'select = ()) returns TimeRegistrationEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/timeRegistrationEntries(${getEncodedUri(timeregistrationentryId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TimeRegistrationEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type timeRegistrationEntry in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + timeregistrationentryId - (v1.0) id for timeRegistrationEntry 
    # + return - (v1.0) Succesfully deleted the specified timeRegistrationEntry 
    remote isolated function deleteTimeRegistrationEntry(string companyId, string timeregistrationentryId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/timeRegistrationEntries(${getEncodedUri(timeregistrationentryId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type timeRegistrationEntry in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + timeregistrationentryId - (v1.0) id for timeRegistrationEntry 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedtimeRegistrationEntry 
    remote isolated function patchTimeRegistrationEntry(string companyId, string timeregistrationentryId, string contentType, string ifMatch, json payload) returns TimeRegistrationEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/timeRegistrationEntries(${getEncodedUri(timeregistrationentryId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TimeRegistrationEntry response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of generalLedgerEntries
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of generalLedgerEntries 
    remote isolated function listGeneralLedgerEntries(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20020|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntries`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20020 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type generalLedgerEntry for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + generalledgerentryId - (v1.0) id for generalLedgerEntry 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested generalLedgerEntry 
    remote isolated function getGeneralLedgerEntry(string companyId, int generalledgerentryId, string[]? expand = (), string[]? 'select = ()) returns GeneralLedgerEntry|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntries(${getEncodedUri(generalledgerentryId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GeneralLedgerEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of currencies
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of currencies 
    remote isolated function listCurrencies(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20021|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/currencies`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20021 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type currency in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new currency has been succesfully created 
    remote isolated function postCurrency(string companyId, string contentType, json payload) returns Currency|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/currencies`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Currency response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type currency for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + currencyId - (v1.0) id for currency 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested currency 
    remote isolated function getCurrency(string companyId, string currencyId, string[]? 'select = ()) returns Currency|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/currencies(${getEncodedUri(currencyId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Currency response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type currency in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + currencyId - (v1.0) id for currency 
    # + return - (v1.0) Succesfully deleted the specified currency 
    remote isolated function deleteCurrency(string companyId, string currencyId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/currencies(${getEncodedUri(currencyId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type currency in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + currencyId - (v1.0) id for currency 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcurrency 
    remote isolated function patchCurrency(string companyId, string currencyId, string contentType, string ifMatch, json payload) returns Currency|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/currencies(${getEncodedUri(currencyId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Currency response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of paymentMethods
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of paymentMethods 
    remote isolated function listPaymentMethods(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20022|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentMethods`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20022 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type paymentMethod in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new paymentMethod has been succesfully created 
    remote isolated function postPaymentMethod(string companyId, string contentType, json payload) returns PaymentMethod|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentMethods`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentMethod response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type paymentMethod for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + paymentmethodId - (v1.0) id for paymentMethod 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested paymentMethod 
    remote isolated function getPaymentMethod(string companyId, string paymentmethodId, string[]? 'select = ()) returns PaymentMethod|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentMethods(${getEncodedUri(paymentmethodId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type paymentMethod in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + paymentmethodId - (v1.0) id for paymentMethod 
    # + return - (v1.0) Succesfully deleted the specified paymentMethod 
    remote isolated function deletePaymentMethod(string companyId, string paymentmethodId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentMethods(${getEncodedUri(paymentmethodId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type paymentMethod in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + paymentmethodId - (v1.0) id for paymentMethod 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpaymentMethod 
    remote isolated function patchPaymentMethod(string companyId, string paymentmethodId, string contentType, string ifMatch, json payload) returns PaymentMethod|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentMethods(${getEncodedUri(paymentmethodId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentMethod response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of dimensions
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of dimensions 
    remote isolated function listDimensions(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20023|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20023 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type dimension for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + dimensionId - (v1.0) id for dimension 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested dimension 
    remote isolated function getDimension(string companyId, string dimensionId, string[]? expand = (), string[]? 'select = ()) returns Dimension|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensions(${getEncodedUri(dimensionId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Dimension response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dimensionValues
    #
    # + companyId - (v1.0) id for company 
    # + dimensionId - (v1.0) id for dimension 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of dimensionValues 
    remote isolated function listDimensionValuesForDimension(string companyId, string dimensionId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20024|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensions(${getEncodedUri(dimensionId)})/dimensionValues`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20024 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type dimensionValue for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + dimensionId - (v1.0) id for dimension 
    # + dimensionvalueId - (v1.0) id for dimensionValue 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested dimensionValue 
    remote isolated function getDimensionValueForDimension(string companyId, string dimensionId, string dimensionvalueId, string[]? 'select = ()) returns DimensionValue|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensions(${getEncodedUri(dimensionId)})/dimensionValues(${getEncodedUri(dimensionvalueId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DimensionValue response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dimensionValues
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of dimensionValues 
    remote isolated function listDimensionValues(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20024|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionValues`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20024 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type dimensionValue for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + dimensionvalueId - (v1.0) id for dimensionValue 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested dimensionValue 
    remote isolated function getDimensionValue(string companyId, string dimensionvalueId, string[]? 'select = ()) returns DimensionValue|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionValues(${getEncodedUri(dimensionvalueId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DimensionValue response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dimensionLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of dimensionLines 
    remote isolated function listDimensionLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20025|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20025 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type dimensionLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new dimensionLine has been succesfully created 
    remote isolated function postDimensionLine(string companyId, string contentType, json payload) returns DimensionLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DimensionLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type dimensionLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + dimensionlineParentid - (v1.0) parentId for dimensionLine 
    # + dimensionlineId - (v1.0) id for dimensionLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested dimensionLine 
    remote isolated function getDimensionLine(string companyId, string dimensionlineParentid, string dimensionlineId, string[]? expand = (), string[]? 'select = ()) returns DimensionLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionLines(${getEncodedUri(dimensionlineParentid)},${getEncodedUri(dimensionlineId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DimensionLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type dimensionLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + dimensionlineParentid - (v1.0) parentId for dimensionLine 
    # + dimensionlineId - (v1.0) id for dimensionLine 
    # + return - (v1.0) Succesfully deleted the specified dimensionLine 
    remote isolated function deleteDimensionLine(string companyId, string dimensionlineParentid, string dimensionlineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionLines(${getEncodedUri(dimensionlineParentid)},${getEncodedUri(dimensionlineId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type dimensionLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + dimensionlineParentid - (v1.0) parentId for dimensionLine 
    # + dimensionlineId - (v1.0) id for dimensionLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieddimensionLine 
    remote isolated function patchDimensionLine(string companyId, string dimensionlineParentid, string dimensionlineId, string contentType, string ifMatch, json payload) returns DimensionLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/dimensionLines(${getEncodedUri(dimensionlineParentid)},${getEncodedUri(dimensionlineId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DimensionLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of paymentTerms
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of paymentTerms 
    remote isolated function listPaymentTerms(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20026|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentTerms`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20026 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type paymentTerm in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new paymentTerm has been succesfully created 
    remote isolated function postPaymentTerm(string companyId, string contentType, json payload) returns PaymentTerm|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentTerms`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentTerm response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type paymentTerm for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + paymenttermId - (v1.0) id for paymentTerm 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested paymentTerm 
    remote isolated function getPaymentTerm(string companyId, string paymenttermId, string[]? 'select = ()) returns PaymentTerm|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentTerms(${getEncodedUri(paymenttermId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentTerm response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type paymentTerm in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + paymenttermId - (v1.0) id for paymentTerm 
    # + return - (v1.0) Succesfully deleted the specified paymentTerm 
    remote isolated function deletePaymentTerm(string companyId, string paymenttermId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentTerms(${getEncodedUri(paymenttermId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type paymentTerm in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + paymenttermId - (v1.0) id for paymentTerm 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpaymentTerm 
    remote isolated function patchPaymentTerm(string companyId, string paymenttermId, string contentType, string ifMatch, json payload) returns PaymentTerm|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/paymentTerms(${getEncodedUri(paymenttermId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentTerm response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of shipmentMethods
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of shipmentMethods 
    remote isolated function listShipmentMethods(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20027|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/shipmentMethods`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20027 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type shipmentMethod in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new shipmentMethod has been succesfully created 
    remote isolated function postShipmentMethod(string companyId, string contentType, json payload) returns ShipmentMethod|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/shipmentMethods`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShipmentMethod response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type shipmentMethod for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + shipmentmethodId - (v1.0) id for shipmentMethod 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested shipmentMethod 
    remote isolated function getShipmentMethod(string companyId, string shipmentmethodId, string[]? 'select = ()) returns ShipmentMethod|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/shipmentMethods(${getEncodedUri(shipmentmethodId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShipmentMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type shipmentMethod in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + shipmentmethodId - (v1.0) id for shipmentMethod 
    # + return - (v1.0) Succesfully deleted the specified shipmentMethod 
    remote isolated function deleteShipmentMethod(string companyId, string shipmentmethodId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/shipmentMethods(${getEncodedUri(shipmentmethodId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type shipmentMethod in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + shipmentmethodId - (v1.0) id for shipmentMethod 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedshipmentMethod 
    remote isolated function patchShipmentMethod(string companyId, string shipmentmethodId, string contentType, string ifMatch, json payload) returns ShipmentMethod|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/shipmentMethods(${getEncodedUri(shipmentmethodId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShipmentMethod response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of itemCategories
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of itemCategories 
    remote isolated function listItemCategories(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20028|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/itemCategories`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20028 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type itemCategory in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new itemCategory has been succesfully created 
    remote isolated function postItemCategory(string companyId, string contentType, json payload) returns ItemCategory|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/itemCategories`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemCategory response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type itemCategory for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + itemcategoryId - (v1.0) id for itemCategory 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested itemCategory 
    remote isolated function getItemCategory(string companyId, string itemcategoryId, string[]? 'select = ()) returns ItemCategory|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/itemCategories(${getEncodedUri(itemcategoryId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ItemCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type itemCategory in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemcategoryId - (v1.0) id for itemCategory 
    # + return - (v1.0) Succesfully deleted the specified itemCategory 
    remote isolated function deleteItemCategory(string companyId, string itemcategoryId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/itemCategories(${getEncodedUri(itemcategoryId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type itemCategory in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + itemcategoryId - (v1.0) id for itemCategory 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifieditemCategory 
    remote isolated function patchItemCategory(string companyId, string itemcategoryId, string contentType, string ifMatch, json payload) returns ItemCategory|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/itemCategories(${getEncodedUri(itemcategoryId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ItemCategory response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of cashFlowStatement
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of cashFlowStatement 
    remote isolated function listCashFlowStatement(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20029|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/cashFlowStatement`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20029 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type cashFlowStatement for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + cashflowstatementLinenumber - (v1.0) lineNumber for cashFlowStatement 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested cashFlowStatement 
    remote isolated function getCashFlowStatement(string companyId, int cashflowstatementLinenumber, string[]? 'select = ()) returns CashFlowStatement|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/cashFlowStatement(${getEncodedUri(cashflowstatementLinenumber)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CashFlowStatement response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of countriesRegions
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of countriesRegions 
    remote isolated function listCountriesRegions(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20030|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/countriesRegions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20030 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type countryRegion in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new countryRegion has been succesfully created 
    remote isolated function postCountryRegion(string companyId, string contentType, json payload) returns CountryRegion|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/countriesRegions`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CountryRegion response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type countryRegion for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + countryregionId - (v1.0) id for countryRegion 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested countryRegion 
    remote isolated function getCountryRegion(string companyId, string countryregionId, string[]? 'select = ()) returns CountryRegion|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/countriesRegions(${getEncodedUri(countryregionId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CountryRegion response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type countryRegion in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + countryregionId - (v1.0) id for countryRegion 
    # + return - (v1.0) Succesfully deleted the specified countryRegion 
    remote isolated function deleteCountryRegion(string companyId, string countryregionId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/countriesRegions(${getEncodedUri(countryregionId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type countryRegion in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + countryregionId - (v1.0) id for countryRegion 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedcountryRegion 
    remote isolated function patchCountryRegion(string companyId, string countryregionId, string contentType, string ifMatch, json payload) returns CountryRegion|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/countriesRegions(${getEncodedUri(countryregionId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CountryRegion response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of salesOrders
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesOrders 
    remote isolated function listSalesOrders(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20031|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20031 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesOrder in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesOrder has been succesfully created 
    remote isolated function postSalesOrder(string companyId, string contentType, json payload) returns SalesOrder|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesOrder response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesOrder for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesOrder 
    remote isolated function getSalesOrder(string companyId, string salesorderId, string[]? expand = (), string[]? 'select = ()) returns SalesOrder|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesOrder response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesOrder in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + return - (v1.0) Succesfully deleted the specified salesOrder 
    remote isolated function deleteSalesOrder(string companyId, string salesorderId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesOrder in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesOrder 
    remote isolated function patchSalesOrder(string companyId, string salesorderId, string contentType, string ifMatch, json payload) returns SalesOrder|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesOrder response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Performs the shipAndInvoice action for salesOrders entity
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + return - (v1.0) Succesfully performed a shipAndInvoice action on the Dynamic 365 Business Central salesOrders entity 
    remote isolated function shipAndInvoiceActionSalesOrders(string companyId, string salesorderId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})/Microsoft.NAV.shipAndInvoice`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of salesOrderLines
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesOrderLines 
    remote isolated function listSalesOrderLinesForSalesOrder(string companyId, string salesorderId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20032|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})/salesOrderLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20032 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesOrderLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesOrderLine has been succesfully created 
    remote isolated function postSalesOrderLineForSalesOrder(string companyId, string salesorderId, string contentType, json payload) returns SalesOrderLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})/salesOrderLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesOrderLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesOrderLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + salesorderlineId - (v1.0) id for salesOrderLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesOrderLine 
    remote isolated function getSalesOrderLineForSalesOrder(string companyId, string salesorderId, string salesorderlineId, string[]? expand = (), string[]? 'select = ()) returns SalesOrderLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})/salesOrderLines('${getEncodedUri(salesorderlineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesOrderLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesOrderLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + salesorderlineId - (v1.0) id for salesOrderLine 
    # + return - (v1.0) Succesfully deleted the specified salesOrderLine 
    remote isolated function deleteSalesOrderLineForSalesOrder(string companyId, string salesorderId, string salesorderlineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})/salesOrderLines('${getEncodedUri(salesorderlineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesOrderLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderId - (v1.0) id for salesOrder 
    # + salesorderlineId - (v1.0) id for salesOrderLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesOrderLine 
    remote isolated function patchSalesOrderLineForSalesOrder(string companyId, string salesorderId, string salesorderlineId, string contentType, string ifMatch, json payload) returns SalesOrderLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrders(${getEncodedUri(salesorderId)})/salesOrderLines('${getEncodedUri(salesorderlineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesOrderLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of salesOrderLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesOrderLines 
    remote isolated function listSalesOrderLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20032|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrderLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20032 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesOrderLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesOrderLine has been succesfully created 
    remote isolated function postSalesOrderLine(string companyId, string contentType, json payload) returns SalesOrderLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrderLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesOrderLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesOrderLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesorderlineId - (v1.0) id for salesOrderLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesOrderLine 
    remote isolated function getSalesOrderLine(string companyId, string salesorderlineId, string[]? expand = (), string[]? 'select = ()) returns SalesOrderLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrderLines('${getEncodedUri(salesorderlineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesOrderLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesOrderLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderlineId - (v1.0) id for salesOrderLine 
    # + return - (v1.0) Succesfully deleted the specified salesOrderLine 
    remote isolated function deleteSalesOrderLine(string companyId, string salesorderlineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrderLines('${getEncodedUri(salesorderlineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesOrderLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesorderlineId - (v1.0) id for salesOrderLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesOrderLine 
    remote isolated function patchSalesOrderLine(string companyId, string salesorderlineId, string contentType, string ifMatch, json payload) returns SalesOrderLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesOrderLines('${getEncodedUri(salesorderlineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesOrderLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of retainedEarningsStatement
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of retainedEarningsStatement 
    remote isolated function listRetainedEarningsStatement(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20033|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/retainedEarningsStatement`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20033 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type retainedEarningsStatement for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + retainedearningsstatementLinenumber - (v1.0) lineNumber for retainedEarningsStatement 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested retainedEarningsStatement 
    remote isolated function getRetainedEarningsStatement(string companyId, int retainedearningsstatementLinenumber, string[]? 'select = ()) returns RetainedEarningsStatement|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/retainedEarningsStatement(${getEncodedUri(retainedearningsstatementLinenumber)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        RetainedEarningsStatement response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of unitsOfMeasure
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of unitsOfMeasure 
    remote isolated function listUnitsOfMeasure(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20034|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/unitsOfMeasure`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20034 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type unitOfMeasure in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new unitOfMeasure has been succesfully created 
    remote isolated function postUnitOfMeasure(string companyId, string contentType, json payload) returns UnitOfMeasure|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/unitsOfMeasure`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UnitOfMeasure response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type unitOfMeasure for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + unitofmeasureId - (v1.0) id for unitOfMeasure 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested unitOfMeasure 
    remote isolated function getUnitOfMeasure(string companyId, string unitofmeasureId, string[]? 'select = ()) returns UnitOfMeasure|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/unitsOfMeasure(${getEncodedUri(unitofmeasureId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UnitOfMeasure response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type unitOfMeasure in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + unitofmeasureId - (v1.0) id for unitOfMeasure 
    # + return - (v1.0) Succesfully deleted the specified unitOfMeasure 
    remote isolated function deleteUnitOfMeasure(string companyId, string unitofmeasureId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/unitsOfMeasure(${getEncodedUri(unitofmeasureId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type unitOfMeasure in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + unitofmeasureId - (v1.0) id for unitOfMeasure 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedunitOfMeasure 
    remote isolated function patchUnitOfMeasure(string companyId, string unitofmeasureId, string contentType, string ifMatch, json payload) returns UnitOfMeasure|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/unitsOfMeasure(${getEncodedUri(unitofmeasureId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UnitOfMeasure response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of agedAccountsReceivable
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of agedAccountsReceivable 
    remote isolated function listAgedAccountsReceivable(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20035|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/agedAccountsReceivable`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20035 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type agedAccountsReceivable for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + agedaccountsreceivableCustomerid - (v1.0) customerId for agedAccountsReceivable 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested agedAccountsReceivable 
    remote isolated function getAgedAccountsReceivable(string companyId, string agedaccountsreceivableCustomerid, string[]? 'select = ()) returns AgedAccountsReceivable|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/agedAccountsReceivable(${getEncodedUri(agedaccountsreceivableCustomerid)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AgedAccountsReceivable response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of agedAccountsPayable
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of agedAccountsPayable 
    remote isolated function listAgedAccountsPayable(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20036|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/agedAccountsPayable`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20036 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type agedAccountsPayable for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + agedaccountspayableVendorid - (v1.0) vendorId for agedAccountsPayable 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested agedAccountsPayable 
    remote isolated function getAgedAccountsPayable(string companyId, string agedaccountspayableVendorid, string[]? 'select = ()) returns AgedAccountsPayable|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/agedAccountsPayable(${getEncodedUri(agedaccountspayableVendorid)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AgedAccountsPayable response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of balanceSheet
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of balanceSheet 
    remote isolated function listBalanceSheet(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20037|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/balanceSheet`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20037 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type balanceSheet for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + balancesheetLinenumber - (v1.0) lineNumber for balanceSheet 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested balanceSheet 
    remote isolated function getBalanceSheet(string companyId, int balancesheetLinenumber, string[]? 'select = ()) returns BalanceSheet|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/balanceSheet(${getEncodedUri(balancesheetLinenumber)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BalanceSheet response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of trialBalance
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of trialBalance 
    remote isolated function listTrialBalance(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20038|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/trialBalance`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20038 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type trialBalance for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + trialbalanceNumber - (v1.0) number for trialBalance 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested trialBalance 
    remote isolated function getTrialBalance(string companyId, string trialbalanceNumber, string[]? expand = (), string[]? 'select = ()) returns TrialBalance|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/trialBalance('${getEncodedUri(trialbalanceNumber)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TrialBalance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of incomeStatement
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of incomeStatement 
    remote isolated function listIncomeStatement(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20039|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/incomeStatement`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20039 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type incomeStatement for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + incomestatementLinenumber - (v1.0) lineNumber for incomeStatement 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested incomeStatement 
    remote isolated function getIncomeStatement(string companyId, int incomestatementLinenumber, string[]? 'select = ()) returns IncomeStatement|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/incomeStatement(${getEncodedUri(incomestatementLinenumber)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        IncomeStatement response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of taxAreas
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of taxAreas 
    remote isolated function listTaxAreas(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20040|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxAreas`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20040 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type taxArea in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new taxArea has been succesfully created 
    remote isolated function postTaxArea(string companyId, string contentType, json payload) returns TaxArea|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxAreas`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxArea response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type taxArea for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + taxareaId - (v1.0) id for taxArea 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested taxArea 
    remote isolated function getTaxArea(string companyId, string taxareaId, string[]? 'select = ()) returns TaxArea|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxAreas(${getEncodedUri(taxareaId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxArea response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type taxArea in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + taxareaId - (v1.0) id for taxArea 
    # + return - (v1.0) Succesfully deleted the specified taxArea 
    remote isolated function deleteTaxArea(string companyId, string taxareaId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxAreas(${getEncodedUri(taxareaId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type taxArea in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + taxareaId - (v1.0) id for taxArea 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedtaxArea 
    remote isolated function patchTaxArea(string companyId, string taxareaId, string contentType, string ifMatch, json payload) returns TaxArea|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/taxAreas(${getEncodedUri(taxareaId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxArea response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of salesQuotes
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesQuotes 
    remote isolated function listSalesQuotes(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20041|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20041 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesQuote in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesQuote has been succesfully created 
    remote isolated function postSalesQuote(string companyId, string contentType, json payload) returns SalesQuote|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesQuote response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesQuote for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesQuote 
    remote isolated function getSalesQuote(string companyId, string salesquoteId, string[]? expand = (), string[]? 'select = ()) returns SalesQuote|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesQuote response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesQuote in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + return - (v1.0) Succesfully deleted the specified salesQuote 
    remote isolated function deleteSalesQuote(string companyId, string salesquoteId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesQuote in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesQuote 
    remote isolated function patchSalesQuote(string companyId, string salesquoteId, string contentType, string ifMatch, json payload) returns SalesQuote|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesQuote response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Performs the makeInvoice action for salesQuotes entity
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + return - (v1.0) Succesfully performed a makeInvoice action on the Dynamic 365 Business Central salesQuotes entity 
    remote isolated function makeInvoiceActionSalesQuotes(string companyId, string salesquoteId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/Microsoft.NAV.makeInvoice`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the makeOrder action for salesQuotes entity
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + return - (v1.0) Succesfully performed a makeOrder action on the Dynamic 365 Business Central salesQuotes entity 
    remote isolated function makeOrderActionSalesQuotes(string companyId, string salesquoteId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/Microsoft.NAV.makeOrder`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the send action for salesQuotes entity
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + return - (v1.0) Succesfully performed a send action on the Dynamic 365 Business Central salesQuotes entity 
    remote isolated function sendActionSalesQuotes(string companyId, string salesquoteId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/Microsoft.NAV.send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of salesQuoteLines
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesQuoteLines 
    remote isolated function listSalesQuoteLinesForSalesQuote(string companyId, string salesquoteId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20042|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/salesQuoteLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20042 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesQuoteLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesQuoteLine has been succesfully created 
    remote isolated function postSalesQuoteLineForSalesQuote(string companyId, string salesquoteId, string contentType, json payload) returns SalesQuoteLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/salesQuoteLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesQuoteLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesQuoteLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + salesquotelineId - (v1.0) id for salesQuoteLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesQuoteLine 
    remote isolated function getSalesQuoteLineForSalesQuote(string companyId, string salesquoteId, string salesquotelineId, string[]? expand = (), string[]? 'select = ()) returns SalesQuoteLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/salesQuoteLines('${getEncodedUri(salesquotelineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesQuoteLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesQuoteLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + salesquotelineId - (v1.0) id for salesQuoteLine 
    # + return - (v1.0) Succesfully deleted the specified salesQuoteLine 
    remote isolated function deleteSalesQuoteLineForSalesQuote(string companyId, string salesquoteId, string salesquotelineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/salesQuoteLines('${getEncodedUri(salesquotelineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesQuoteLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + salesquotelineId - (v1.0) id for salesQuoteLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesQuoteLine 
    remote isolated function patchSalesQuoteLineForSalesQuote(string companyId, string salesquoteId, string salesquotelineId, string contentType, string ifMatch, json payload) returns SalesQuoteLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/salesQuoteLines('${getEncodedUri(salesquotelineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesQuoteLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of pdfDocument
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of pdfDocument 
    remote isolated function listPdfDocumentForSalesQuote(string companyId, string salesquoteId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20010|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/pdfDocument`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type pdfDocument for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesquoteId - (v1.0) id for salesQuote 
    # + pdfdocumentId - (v1.0) id for pdfDocument 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested pdfDocument 
    remote isolated function getPdfDocumentForSalesQuote(string companyId, string salesquoteId, string pdfdocumentId, string[]? 'select = ()) returns PdfDocument|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuotes(${getEncodedUri(salesquoteId)})/pdfDocument(${getEncodedUri(pdfdocumentId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PdfDocument response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of salesQuoteLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesQuoteLines 
    remote isolated function listSalesQuoteLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20042|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuoteLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20042 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesQuoteLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesQuoteLine has been succesfully created 
    remote isolated function postSalesQuoteLine(string companyId, string contentType, json payload) returns SalesQuoteLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuoteLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesQuoteLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesQuoteLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salesquotelineId - (v1.0) id for salesQuoteLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesQuoteLine 
    remote isolated function getSalesQuoteLine(string companyId, string salesquotelineId, string[]? expand = (), string[]? 'select = ()) returns SalesQuoteLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuoteLines('${getEncodedUri(salesquotelineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesQuoteLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesQuoteLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquotelineId - (v1.0) id for salesQuoteLine 
    # + return - (v1.0) Succesfully deleted the specified salesQuoteLine 
    remote isolated function deleteSalesQuoteLine(string companyId, string salesquotelineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuoteLines('${getEncodedUri(salesquotelineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesQuoteLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salesquotelineId - (v1.0) id for salesQuoteLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesQuoteLine 
    remote isolated function patchSalesQuoteLine(string companyId, string salesquotelineId, string contentType, string ifMatch, json payload) returns SalesQuoteLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesQuoteLines('${getEncodedUri(salesquotelineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesQuoteLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of salesCreditMemos
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesCreditMemos 
    remote isolated function listSalesCreditMemos(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20043|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20043 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesCreditMemo in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesCreditMemo has been succesfully created 
    remote isolated function postSalesCreditMemo(string companyId, string contentType, json payload) returns SalesCreditMemo|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesCreditMemo response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesCreditMemo for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesCreditMemo 
    remote isolated function getSalesCreditMemo(string companyId, string salescreditmemoId, string[]? expand = (), string[]? 'select = ()) returns SalesCreditMemo|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesCreditMemo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesCreditMemo in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + return - (v1.0) Succesfully deleted the specified salesCreditMemo 
    remote isolated function deleteSalesCreditMemo(string companyId, string salescreditmemoId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesCreditMemo in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesCreditMemo 
    remote isolated function patchSalesCreditMemo(string companyId, string salescreditmemoId, string contentType, string ifMatch, json payload) returns SalesCreditMemo|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesCreditMemo response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Performs the cancelAndSend action for salesCreditMemos entity
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + return - (v1.0) Succesfully performed a cancelAndSend action on the Dynamic 365 Business Central salesCreditMemos entity 
    remote isolated function cancelAndSendActionSalesCreditMemos(string companyId, string salescreditmemoId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/Microsoft.NAV.cancelAndSend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the cancel action for salesCreditMemos entity
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + return - (v1.0) Succesfully performed a cancel action on the Dynamic 365 Business Central salesCreditMemos entity 
    remote isolated function cancelActionSalesCreditMemos(string companyId, string salescreditmemoId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/Microsoft.NAV.cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the postAndSend action for salesCreditMemos entity
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + return - (v1.0) Succesfully performed a postAndSend action on the Dynamic 365 Business Central salesCreditMemos entity 
    remote isolated function postAndSendActionSalesCreditMemos(string companyId, string salescreditmemoId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/Microsoft.NAV.postAndSend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the post action for salesCreditMemos entity
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + return - (v1.0) Succesfully performed a post action on the Dynamic 365 Business Central salesCreditMemos entity 
    remote isolated function postActionSalesCreditMemos(string companyId, string salescreditmemoId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/Microsoft.NAV.post`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Performs the send action for salesCreditMemos entity
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + return - (v1.0) Succesfully performed a send action on the Dynamic 365 Business Central salesCreditMemos entity 
    remote isolated function sendActionSalesCreditMemos(string companyId, string salescreditmemoId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/Microsoft.NAV.send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of salesCreditMemoLines
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesCreditMemoLines 
    remote isolated function listSalesCreditMemoLinesForSalesCreditMemo(string companyId, string salescreditmemoId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20044|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/salesCreditMemoLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20044 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesCreditMemoLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesCreditMemoLine has been succesfully created 
    remote isolated function postSalesCreditMemoLineForSalesCreditMemo(string companyId, string salescreditmemoId, string contentType, json payload) returns SalesCreditMemoLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/salesCreditMemoLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesCreditMemoLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesCreditMemoLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + salescreditmemolineId - (v1.0) id for salesCreditMemoLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesCreditMemoLine 
    remote isolated function getSalesCreditMemoLineForSalesCreditMemo(string companyId, string salescreditmemoId, string salescreditmemolineId, string[]? expand = (), string[]? 'select = ()) returns SalesCreditMemoLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/salesCreditMemoLines('${getEncodedUri(salescreditmemolineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesCreditMemoLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesCreditMemoLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + salescreditmemolineId - (v1.0) id for salesCreditMemoLine 
    # + return - (v1.0) Succesfully deleted the specified salesCreditMemoLine 
    remote isolated function deleteSalesCreditMemoLineForSalesCreditMemo(string companyId, string salescreditmemoId, string salescreditmemolineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/salesCreditMemoLines('${getEncodedUri(salescreditmemolineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesCreditMemoLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + salescreditmemolineId - (v1.0) id for salesCreditMemoLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesCreditMemoLine 
    remote isolated function patchSalesCreditMemoLineForSalesCreditMemo(string companyId, string salescreditmemoId, string salescreditmemolineId, string contentType, string ifMatch, json payload) returns SalesCreditMemoLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/salesCreditMemoLines('${getEncodedUri(salescreditmemolineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesCreditMemoLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of pdfDocument
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of pdfDocument 
    remote isolated function listPdfDocumentForSalesCreditMemo(string companyId, string salescreditmemoId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20010|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/pdfDocument`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type pdfDocument for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemoId - (v1.0) id for salesCreditMemo 
    # + pdfdocumentId - (v1.0) id for pdfDocument 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested pdfDocument 
    remote isolated function getPdfDocumentForSalesCreditMemo(string companyId, string salescreditmemoId, string pdfdocumentId, string[]? 'select = ()) returns PdfDocument|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemos(${getEncodedUri(salescreditmemoId)})/pdfDocument(${getEncodedUri(pdfdocumentId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PdfDocument response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of salesCreditMemoLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of salesCreditMemoLines 
    remote isolated function listSalesCreditMemoLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20044|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemoLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20044 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type salesCreditMemoLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new salesCreditMemoLine has been succesfully created 
    remote isolated function postSalesCreditMemoLine(string companyId, string contentType, json payload) returns SalesCreditMemoLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemoLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesCreditMemoLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type salesCreditMemoLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemolineId - (v1.0) id for salesCreditMemoLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested salesCreditMemoLine 
    remote isolated function getSalesCreditMemoLine(string companyId, string salescreditmemolineId, string[]? expand = (), string[]? 'select = ()) returns SalesCreditMemoLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemoLines('${getEncodedUri(salescreditmemolineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SalesCreditMemoLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type salesCreditMemoLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemolineId - (v1.0) id for salesCreditMemoLine 
    # + return - (v1.0) Succesfully deleted the specified salesCreditMemoLine 
    remote isolated function deleteSalesCreditMemoLine(string companyId, string salescreditmemolineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemoLines('${getEncodedUri(salescreditmemolineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type salesCreditMemoLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + salescreditmemolineId - (v1.0) id for salesCreditMemoLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedsalesCreditMemoLine 
    remote isolated function patchSalesCreditMemoLine(string companyId, string salescreditmemolineId, string contentType, string ifMatch, json payload) returns SalesCreditMemoLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/salesCreditMemoLines('${getEncodedUri(salescreditmemolineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SalesCreditMemoLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of generalLedgerEntryAttachments
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of generalLedgerEntryAttachments 
    remote isolated function listGeneralLedgerEntryAttachments(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20045|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntryAttachments`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20045 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type generalLedgerEntryAttachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new generalLedgerEntryAttachments has been succesfully created 
    remote isolated function postGeneralLedgerEntryAttachments(string companyId, string contentType, json payload) returns GeneralLedgerEntryAttachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntryAttachments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GeneralLedgerEntryAttachments response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type generalLedgerEntryAttachments for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + generalledgerentryattachmentsGeneralledgerentrynumber - (v1.0) generalLedgerEntryNumber for generalLedgerEntryAttachments 
    # + generalledgerentryattachmentsId - (v1.0) id for generalLedgerEntryAttachments 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested generalLedgerEntryAttachments 
    remote isolated function getGeneralLedgerEntryAttachments(string companyId, int generalledgerentryattachmentsGeneralledgerentrynumber, string generalledgerentryattachmentsId, string[]? expand = (), string[]? 'select = ()) returns GeneralLedgerEntryAttachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntryAttachments(${getEncodedUri(generalledgerentryattachmentsGeneralledgerentrynumber)},${getEncodedUri(generalledgerentryattachmentsId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GeneralLedgerEntryAttachments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type generalLedgerEntryAttachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + generalledgerentryattachmentsGeneralledgerentrynumber - (v1.0) generalLedgerEntryNumber for generalLedgerEntryAttachments 
    # + generalledgerentryattachmentsId - (v1.0) id for generalLedgerEntryAttachments 
    # + return - (v1.0) Succesfully deleted the specified generalLedgerEntryAttachments 
    remote isolated function deleteGeneralLedgerEntryAttachments(string companyId, int generalledgerentryattachmentsGeneralledgerentrynumber, string generalledgerentryattachmentsId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntryAttachments(${getEncodedUri(generalledgerentryattachmentsGeneralledgerentrynumber)},${getEncodedUri(generalledgerentryattachmentsId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type generalLedgerEntryAttachments in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + generalledgerentryattachmentsGeneralledgerentrynumber - (v1.0) generalLedgerEntryNumber for generalLedgerEntryAttachments 
    # + generalledgerentryattachmentsId - (v1.0) id for generalLedgerEntryAttachments 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedgeneralLedgerEntryAttachments 
    remote isolated function patchGeneralLedgerEntryAttachments(string companyId, int generalledgerentryattachmentsGeneralledgerentrynumber, string generalledgerentryattachmentsId, string contentType, string ifMatch, json payload) returns GeneralLedgerEntryAttachments|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/generalLedgerEntryAttachments(${getEncodedUri(generalledgerentryattachmentsGeneralledgerentrynumber)},${getEncodedUri(generalledgerentryattachmentsId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GeneralLedgerEntryAttachments response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of purchaseInvoices
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of purchaseInvoices 
    remote isolated function listPurchaseInvoices(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20046|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20046 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type purchaseInvoice in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new purchaseInvoice has been succesfully created 
    remote isolated function postPurchaseInvoice(string companyId, string contentType, json payload) returns PurchaseInvoice|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PurchaseInvoice response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type purchaseInvoice for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested purchaseInvoice 
    remote isolated function getPurchaseInvoice(string companyId, string purchaseinvoiceId, string[]? expand = (), string[]? 'select = ()) returns PurchaseInvoice|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PurchaseInvoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type purchaseInvoice in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + return - (v1.0) Succesfully deleted the specified purchaseInvoice 
    remote isolated function deletePurchaseInvoice(string companyId, string purchaseinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type purchaseInvoice in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpurchaseInvoice 
    remote isolated function patchPurchaseInvoice(string companyId, string purchaseinvoiceId, string contentType, string ifMatch, json payload) returns PurchaseInvoice|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PurchaseInvoice response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Performs the post action for purchaseInvoices entity
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + return - (v1.0) Succesfully performed a post action on the Dynamic 365 Business Central purchaseInvoices entity 
    remote isolated function postActionPurchaseInvoices(string companyId, string purchaseinvoiceId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/Microsoft.NAV.post`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of purchaseInvoiceLines
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of purchaseInvoiceLines 
    remote isolated function listPurchaseInvoiceLinesForPurchaseInvoice(string companyId, string purchaseinvoiceId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20047|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/purchaseInvoiceLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20047 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type purchaseInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new purchaseInvoiceLine has been succesfully created 
    remote isolated function postPurchaseInvoiceLineForPurchaseInvoice(string companyId, string purchaseinvoiceId, string contentType, json payload) returns PurchaseInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/purchaseInvoiceLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PurchaseInvoiceLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type purchaseInvoiceLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + purchaseinvoicelineId - (v1.0) id for purchaseInvoiceLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested purchaseInvoiceLine 
    remote isolated function getPurchaseInvoiceLineForPurchaseInvoice(string companyId, string purchaseinvoiceId, string purchaseinvoicelineId, string[]? expand = (), string[]? 'select = ()) returns PurchaseInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/purchaseInvoiceLines('${getEncodedUri(purchaseinvoicelineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PurchaseInvoiceLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type purchaseInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + purchaseinvoicelineId - (v1.0) id for purchaseInvoiceLine 
    # + return - (v1.0) Succesfully deleted the specified purchaseInvoiceLine 
    remote isolated function deletePurchaseInvoiceLineForPurchaseInvoice(string companyId, string purchaseinvoiceId, string purchaseinvoicelineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/purchaseInvoiceLines('${getEncodedUri(purchaseinvoicelineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type purchaseInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + purchaseinvoicelineId - (v1.0) id for purchaseInvoiceLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpurchaseInvoiceLine 
    remote isolated function patchPurchaseInvoiceLineForPurchaseInvoice(string companyId, string purchaseinvoiceId, string purchaseinvoicelineId, string contentType, string ifMatch, json payload) returns PurchaseInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/purchaseInvoiceLines('${getEncodedUri(purchaseinvoicelineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PurchaseInvoiceLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of pdfDocument
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of pdfDocument 
    remote isolated function listPdfDocumentForPurchaseInvoice(string companyId, string purchaseinvoiceId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20010|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/pdfDocument`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type pdfDocument for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoiceId - (v1.0) id for purchaseInvoice 
    # + pdfdocumentId - (v1.0) id for pdfDocument 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested pdfDocument 
    remote isolated function getPdfDocumentForPurchaseInvoice(string companyId, string purchaseinvoiceId, string pdfdocumentId, string[]? 'select = ()) returns PdfDocument|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoices(${getEncodedUri(purchaseinvoiceId)})/pdfDocument(${getEncodedUri(pdfdocumentId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PdfDocument response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of purchaseInvoiceLines
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of purchaseInvoiceLines 
    remote isolated function listPurchaseInvoiceLines(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? expand = (), string[]? 'select = ()) returns InlineResponse20047|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoiceLines`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20047 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type purchaseInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new purchaseInvoiceLine has been succesfully created 
    remote isolated function postPurchaseInvoiceLine(string companyId, string contentType, json payload) returns PurchaseInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoiceLines`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PurchaseInvoiceLine response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type purchaseInvoiceLine for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoicelineId - (v1.0) id for purchaseInvoiceLine 
    # + expand - (v1.0) Entities to expand 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested purchaseInvoiceLine 
    remote isolated function getPurchaseInvoiceLine(string companyId, string purchaseinvoicelineId, string[]? expand = (), string[]? 'select = ()) returns PurchaseInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoiceLines('${getEncodedUri(purchaseinvoicelineId)}')`;
        map<anydata> queryParam = {"$expand": expand, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$expand": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PurchaseInvoiceLine response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type purchaseInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoicelineId - (v1.0) id for purchaseInvoiceLine 
    # + return - (v1.0) Succesfully deleted the specified purchaseInvoiceLine 
    remote isolated function deletePurchaseInvoiceLine(string companyId, string purchaseinvoicelineId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoiceLines('${getEncodedUri(purchaseinvoicelineId)}')`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type purchaseInvoiceLine in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + purchaseinvoicelineId - (v1.0) id for purchaseInvoiceLine 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedpurchaseInvoiceLine 
    remote isolated function patchPurchaseInvoiceLine(string companyId, string purchaseinvoicelineId, string contentType, string ifMatch, json payload) returns PurchaseInvoiceLine|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/purchaseInvoiceLines('${getEncodedUri(purchaseinvoicelineId)}')`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PurchaseInvoiceLine response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of projects
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of projects 
    remote isolated function listProjects(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20048|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/projects`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20048 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type project in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new project has been succesfully created 
    remote isolated function postProject(string companyId, string contentType, json payload) returns Project|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/projects`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type project for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + projectId - (v1.0) id for project 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested project 
    remote isolated function getProject(string companyId, string projectId, string[]? 'select = ()) returns Project|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/projects(${getEncodedUri(projectId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type project in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + projectId - (v1.0) id for project 
    # + return - (v1.0) Succesfully deleted the specified project 
    remote isolated function deleteProject(string companyId, string projectId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/projects(${getEncodedUri(projectId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type project in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + projectId - (v1.0) id for project 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedproject 
    remote isolated function patchProject(string companyId, string projectId, string contentType, string ifMatch, json payload) returns Project|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/projects(${getEncodedUri(projectId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of bankAccounts
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of bankAccounts 
    remote isolated function listBankAccounts(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20049|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/bankAccounts`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20049 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an object of type bankAccount in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + contentType - (v1.0) application/json 
    # + return - (v1.0) A new bankAccount has been succesfully created 
    remote isolated function postBankAccount(string companyId, string contentType, json payload) returns BankAccount|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/bankAccounts`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankAccount response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the properties and relationships of an object of type bankAccount for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + bankaccountId - (v1.0) id for bankAccount 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested bankAccount 
    remote isolated function getBankAccount(string companyId, string bankaccountId, string[]? 'select = ()) returns BankAccount|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/bankAccounts(${getEncodedUri(bankaccountId)})`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BankAccount response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an object of type bankAccount in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + bankaccountId - (v1.0) id for bankAccount 
    # + return - (v1.0) Succesfully deleted the specified bankAccount 
    remote isolated function deleteBankAccount(string companyId, string bankaccountId) returns http:Response|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/bankAccounts(${getEncodedUri(bankaccountId)})`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an object of type bankAccount in Dynamics 365 Business Central
    #
    # + companyId - (v1.0) id for company 
    # + bankaccountId - (v1.0) id for bankAccount 
    # + contentType - (v1.0) application/json 
    # + ifMatch - (v1.0) Required. When this request header is included and the eTag provided does not match the current tag on the entity, this will not be updated. 
    # + return - (v1.0) Succesfully updated the specifiedbankAccount 
    remote isolated function patchBankAccount(string companyId, string bankaccountId, string contentType, string ifMatch, json payload) returns BankAccount|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/bankAccounts(${getEncodedUri(bankaccountId)})`;
        map<any> headerValues = {"Content-Type": contentType, "If-Match": ifMatch};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BankAccount response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of customerSales
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of customerSales 
    remote isolated function listCustomerSales(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20050|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerSales`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20050 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type customerSale for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + customersaleCustomerid - (v1.0) customerId for customerSale 
    # + customersaleCustomernumber - (v1.0) customerNumber for customerSale 
    # + customersaleName - (v1.0) name for customerSale 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested customerSale 
    remote isolated function getCustomerSale(string companyId, string customersaleCustomerid, string customersaleCustomernumber, string customersaleName, string[]? 'select = ()) returns CustomerSale|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/customerSales(${getEncodedUri(customersaleCustomerid)},'${getEncodedUri(customersaleCustomernumber)}','${getEncodedUri(customersaleName)}')`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerSale response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of vendorPurchases
    #
    # + companyId - (v1.0) id for company 
    # + top - (v1.0) Number of items to return from the top of the list 
    # + skip - (v1.0) Number of items to skip from the list 
    # + 'limit - (v1.0) Number of items to return from the list 
    # + filter - (v1.0) Filtering expression 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned a list of vendorPurchases 
    remote isolated function listVendorPurchases(string companyId, int? top = (), int? skip = (), int? 'limit = (), string? filter = (), string[]? 'select = ()) returns InlineResponse20051|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendorPurchases`;
        map<anydata> queryParam = {"$top": top, "$skip": skip, "$limit": 'limit, "$filter": filter, "$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20051 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the properties and relationships of an object of type vendorPurchase for Dynamics 365 Business Central.
    #
    # + companyId - (v1.0) id for company 
    # + vendorpurchaseVendorid - (v1.0) vendorId for vendorPurchase 
    # + vendorpurchaseVendornumber - (v1.0) vendorNumber for vendorPurchase 
    # + vendorpurchaseName - (v1.0) name for vendorPurchase 
    # + 'select - (v1.0) Selected properties to be retrieved 
    # + return - (v1.0) Succesfully returned the requested vendorPurchase 
    remote isolated function getVendorPurchase(string companyId, string vendorpurchaseVendorid, string vendorpurchaseVendornumber, string vendorpurchaseName, string[]? 'select = ()) returns VendorPurchase|error {
        string resourcePath = string `/companies(${getEncodedUri(companyId)})/vendorPurchases(${getEncodedUri(vendorpurchaseVendorid)},'${getEncodedUri(vendorpurchaseVendornumber)}','${getEncodedUri(vendorpurchaseName)}')`;
        map<anydata> queryParam = {"$select": 'select};
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        VendorPurchase response = check self.clientEp->get(resourcePath);
        return response;
    }
}
