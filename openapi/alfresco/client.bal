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

# This is a generated connector for [Alfresco API](https://docs.alfresco.com/content-services) OpenAPI Specification.
# The Alfresco REST API enable you to access to the core features of Alfresco Content Services.
@display {label: "Alfresco", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Alfresco devoloper account](https://www.alfresco.com/try-alfresco) and [obtain tokens](https://docs.alfresco.com/process-services/1.10/config/authenticate/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # List comments
    #
    # + nodeId - The identifier of a node. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listComments(string nodeId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns CommentPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/comments`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CommentPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a comment
    #
    # + nodeId - The identifier of a node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The comment text. Note that you can also provide a list of comments. 
    # + return - Successful response 
    remote isolated function createComment(string nodeId, CommentBody payload, string[]? fields = ()) returns CommentEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/comments`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CommentEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update a comment
    #
    # + nodeId - The identifier of a node. 
    # + commentId - The identifier of a comment. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The JSON representing the comment to be updated. 
    # + return - Successful response 
    remote isolated function updateComment(string nodeId, string commentId, CommentBody payload, string[]? fields = ()) returns CommentEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/comments/${getEncodedUri(commentId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CommentEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a comment
    #
    # + nodeId - The identifier of a node. 
    # + commentId - The identifier of a comment. 
    # + return - Successful response 
    remote isolated function deleteComment(string nodeId, string commentId) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/comments/${getEncodedUri(commentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List ratings
    #
    # + nodeId - The identifier of a node. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listRatings(string nodeId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns RatingPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/ratings`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        RatingPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a rating
    #
    # + nodeId - The identifier of a node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - For "myRating" the type is specific to the rating scheme, boolean for the likes and an integer for the fiveStar. 
    # + return - Successful response 
    remote isolated function createRating(string nodeId, RatingBody payload, string[]? fields = ()) returns RatingEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/ratings`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RatingEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a rating
    #
    # + nodeId - The identifier of a node. 
    # + ratingId - The identifier of a rating. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getRating(string nodeId, string ratingId, string[]? fields = ()) returns RatingEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/ratings/${getEncodedUri(ratingId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        RatingEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a rating
    #
    # + nodeId - The identifier of a node. 
    # + ratingId - The identifier of a rating. 
    # + return - Successful response 
    remote isolated function deleteRating(string nodeId, string ratingId) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/ratings/${getEncodedUri(ratingId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List tags for a node
    #
    # + nodeId - The identifier of a node. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listTagsForNode(string nodeId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns TagPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/tags`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TagPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a tag for a node
    #
    # + nodeId - The identifier of a node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The new tag 
    # + return - Successful response 
    remote isolated function createTagForNode(string nodeId, TagBody payload, string[]? fields = ()) returns TagEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/tags`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TagEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a tag from a node
    #
    # + nodeId - The identifier of a node. 
    # + tagId - The identifier of a tag. 
    # + return - Successful response 
    remote isolated function deleteTagFromNode(string nodeId, string tagId) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/tags/${getEncodedUri(tagId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a node
    #
    # + nodeId - The identifier of a node. You can also use one of these well-known aliases: * -my- * -shared- * -root- 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + relativePath - A path relative to the **nodeId**. If you set this, information is returned on the node resolved by this path. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getNode(string nodeId, string[]? include = (), string? relativePath = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}`;
        map<anydata> queryParam = {"include": include, "relativePath": relativePath, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodeEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a node
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The node information to update. 
    # + return - Successful response 
    remote isolated function updateNode(string nodeId, NodeBodyUpdate payload, string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NodeEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a node
    #
    # + nodeId - The identifier of a node. 
    # + permanent - If **true** then the node is deleted permanently, without moving to the trashcan. Only the owner of the node or an admin can permanently delete the node. 
    # + return - Successful response 
    remote isolated function deleteNode(string nodeId, boolean permanent = false) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}`;
        map<anydata> queryParam = {"permanent": permanent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List node children
    #
    # + nodeId - The identifier of a node. You can also use one of these well-known aliases: * -my- * -shared- * -root- 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + 'where - Optionally filter the list. Here are some examples: *   ```where=(isFolder=true)``` *   ```where=(isFile=true)``` *   ```where=(nodeType='my:specialNodeType')``` *   ```where=(nodeType='my:specialNodeType INCLUDESUBTYPES')``` *   ```where=(isPrimary=true)``` *   ```where=(assocType='my:specialAssocType')``` *   ```where=(isPrimary=false and assocType='my:specialAssocType')``` 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * association * isLink * isFavorite * isLocked * path * properties * permissions 
    # + relativePath - Return information on children in the folder resolved by this path. The path is relative to **nodeId**. 
    # + includeSource - Also include **source** in addition to **entries** with folder information on the parent node â€“ either the specified parent **nodeId**, or as resolved by **relativePath**. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listNodeChildren(string nodeId, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string? 'where = (), string[]? include = (), string? relativePath = (), boolean? includeSource = (), string[]? fields = ()) returns NodeChildAssociationPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/children`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "where": 'where, "include": include, "relativePath": relativePath, "includeSource": includeSource, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodeChildAssociationPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a node
    #
    # + nodeId - The identifier of a node. You can also use one of these well-known aliases: * -my- * -shared- * -root- 
    # + autoRename - If true, then  a name clash will cause an attempt to auto rename by finding a unique name using an integer suffix. 
    # + majorVersion - If true, then created node will be version *1.0 MAJOR*. If false, then created node will be version *0.1 MINOR*. 
    # + versioningEnabled - If true, then created node will be versioned. If false, then created node will be unversioned and auto-versioning disabled. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The node information to create. 
    # + return - Successful response 
    remote isolated function createNode(string nodeId, NodeBodyCreate payload, boolean? autoRename = (), boolean? majorVersion = (), boolean? versioningEnabled = (), string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/children`;
        map<anydata> queryParam = {"autoRename": autoRename, "majorVersion": majorVersion, "versioningEnabled": versioningEnabled, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NodeEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Copy a node
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The targetParentId and, optionally, a new name which should include the fileÂ extension. 
    # + return - Successful response 
    remote isolated function copyNode(string nodeId, NodeBodyCopy payload, string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/copy`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NodeEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lock a node
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - Lock details. 
    # + return - Successful response 
    remote isolated function lockNode(string nodeId, NodeBodyLock payload, string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/lock`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NodeEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unlock a node
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function unlockNode(string nodeId, string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/unlock`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        NodeEntry response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Move a node
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The targetParentId and, optionally, a new name which should include the fileÂ extension. 
    # + return - Successful response 
    remote isolated function moveNode(string nodeId, NodeBodyMove payload, string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/move`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NodeEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get node content
    #
    # + nodeId - The identifier of a node. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + return - Successful response 
    remote isolated function getNodeContent(string nodeId, boolean attachment = true, string? ifModifiedSince = (), string? range = ()) returns string|error? {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/content`;
        map<anydata> queryParam = {"attachment": attachment};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update node content
    #
    # + nodeId - The identifier of a node. 
    # + majorVersion - If **true**, create a major version. Setting this parameter also enables versioning of this node, if it is not already versioned. 
    # + comment - Add a version comment which will appear in version history. Setting this parameter also enables versioning of this node, if it is not already versioned. 
    # + name - Optional new name. This should include the fileÂ extension. The name must not contain spaces or the following special characters: * " < > \ / ? : and |. The character `.` must not be used at the end of the name. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The binary content 
    # + return - Successful response 
    remote isolated function updateNodeContent(string nodeId, byte[] payload, boolean majorVersion = false, string? comment = (), string? name = (), string[]? include = (), string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/content`;
        map<anydata> queryParam = {"majorVersion": majorVersion, "comment": comment, "name": name, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        NodeEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List renditions
    #
    # + nodeId - The identifier of a node. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + return - Successful response 
    remote isolated function listRenditions(string nodeId, string? 'where = ()) returns RenditionPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/renditions`;
        map<anydata> queryParam = {"where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RenditionPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create rendition
    #
    # + nodeId - The identifier of a node. 
    # + payload - The rendition "id". 
    # + return - Request accepted 
    remote isolated function createRendition(string nodeId, RenditionBodyCreate payload) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/renditions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get rendition information
    #
    # + nodeId - The identifier of a node. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + return - Successful response 
    remote isolated function getRendition(string nodeId, string renditionId) returns RenditionEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/renditions/${getEncodedUri(renditionId)}`;
        RenditionEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get rendition content
    #
    # + nodeId - The identifier of a node. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + placeholder - If **true** and there is no rendition for this **nodeId** and **renditionId**, then the placeholder image for the mime type of this rendition is returned, rather than a 404 response. 
    # + return - Successful response 
    remote isolated function getRenditionContent(string nodeId, string renditionId, boolean attachment = true, string? ifModifiedSince = (), string? range = (), boolean placeholder = false) returns string|error? {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/renditions/${getEncodedUri(renditionId)}/content`;
        map<anydata> queryParam = {"attachment": attachment, "placeholder": placeholder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List secondary children
    #
    # + nodeId - The identifier of a parent node. You can also use one of these well-known aliases: * -my- * -shared- * -root- 
    # + 'where - Optionally filter the list by assocType. Here's an example: *   ```where=(assocType='my:specialAssocType')``` 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + includeSource - Also include **source** (in addition to **entries**) with folder information on **nodeId** 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listSecondaryChildren(string nodeId, string? 'where = (), string[]? include = (), int skipCount = 0, int maxItems = 100, boolean? includeSource = (), string[]? fields = ()) returns NodeChildAssociationPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/secondary-children`;
        map<anydata> queryParam = {"where": 'where, "include": include, "skipCount": skipCount, "maxItems": maxItems, "includeSource": includeSource, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodeChildAssociationPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create secondary child
    #
    # + nodeId - The identifier of a parent node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The child node id and assoc type. 
    # + return - Successful response 
    remote isolated function createSecondaryChildAssociation(string nodeId, ChildAssociationBody payload, string[]? fields = ()) returns ChildAssociationEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/secondary-children`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChildAssociationEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete secondary child or children
    #
    # + nodeId - The identifier of a parent node. 
    # + childId - The identifier of a child node. 
    # + assocType - Only delete associations of this type. 
    # + return - Successful response 
    remote isolated function deleteSecondaryChildAssociation(string nodeId, string childId, string? assocType = ()) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/secondary-children/${getEncodedUri(childId)}`;
        map<anydata> queryParam = {"assocType": assocType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List parents
    #
    # + nodeId - The identifier of a child node. You can also use one of these well-known aliases: * -my- * -shared- * -root- 
    # + 'where - Optionally filter the list by **assocType** and/or **isPrimary**. Here are some example filters: *   ```where=(assocType='my:specialAssocType')``` *   ```where=(isPrimary=true)``` *   ```where=(isPrimary=false and assocType='my:specialAssocType')``` 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + includeSource - Also include **source** (in addition to **entries**) with folder information on **nodeId** 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listParents(string nodeId, string? 'where = (), string[]? include = (), int skipCount = 0, int maxItems = 100, boolean? includeSource = (), string[]? fields = ()) returns NodeAssociationPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/parents`;
        map<anydata> queryParam = {"where": 'where, "include": include, "skipCount": skipCount, "maxItems": maxItems, "includeSource": includeSource, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodeAssociationPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List target associations
    #
    # + nodeId - The identifier of a source node. 
    # + 'where - Optionally filter the list by **assocType**. Here's an example: *   ```where=(assocType='my:specialAssocType')``` 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listTargetAssociations(string nodeId, string? 'where = (), string[]? include = (), string[]? fields = ()) returns NodeAssociationPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/targets`;
        map<anydata> queryParam = {"where": 'where, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodeAssociationPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create node association
    #
    # + nodeId - The identifier of a source node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The target node id and assoc type. 
    # + return - Successful response 
    remote isolated function createAssociation(string nodeId, AssociationBody payload, string[]? fields = ()) returns AssociationEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/targets`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssociationEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete node association(s)
    #
    # + nodeId - The identifier of a source node. 
    # + targetId - The identifier of a target node. 
    # + assocType - Only delete associations of this type. 
    # + return - Successful response 
    remote isolated function deleteAssociation(string nodeId, string targetId, string? assocType = ()) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/targets/${getEncodedUri(targetId)}`;
        map<anydata> queryParam = {"assocType": assocType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List source associations
    #
    # + nodeId - The identifier of a target node. 
    # + 'where - Optionally filter the list by **assocType**. Here's an example: *   ```where=(assocType='my:specialAssocType')``` 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listSourceAssociations(string nodeId, string? 'where = (), string[]? include = (), string[]? fields = ()) returns NodeAssociationPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/sources`;
        map<anydata> queryParam = {"where": 'where, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodeAssociationPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List version history
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the version node. The following optional fields can be requested: * properties * aspectNames 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + return - Successful response 
    remote isolated function listVersionHistory(string nodeId, string[]? include = (), string[]? fields = (), int skipCount = 0, int maxItems = 100) returns VersionPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions`;
        map<anydata> queryParam = {"include": include, "fields": fields, "skipCount": skipCount, "maxItems": maxItems};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        VersionPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get version information
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + return - Successful response 
    remote isolated function getVersion(string nodeId, string versionId) returns VersionEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}`;
        VersionEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a version
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + return - Successful response 
    remote isolated function deleteVersion(string nodeId, string versionId) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get version content
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + return - Successful response 
    remote isolated function getVersionContent(string nodeId, string versionId, boolean attachment = true, string? ifModifiedSince = (), string? range = ()) returns string|error? {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}/content`;
        map<anydata> queryParam = {"attachment": attachment};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Revert a version
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - Optionally, specify a version comment and whether this should be a major version, or not. 
    # + return - Successful response 
    remote isolated function revertVersion(string nodeId, string versionId, RevertBody payload, string[]? fields = ()) returns VersionEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}/revert`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VersionEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List renditions for a file version
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + return - Successful response 
    remote isolated function listVersionRenditions(string nodeId, string versionId, string? 'where = ()) returns RenditionPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}/renditions`;
        map<anydata> queryParam = {"where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RenditionPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create rendition for a file version
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + payload - The rendition "id". 
    # + return - Request accepted 
    remote isolated function createVersionRendition(string nodeId, string versionId, RenditionBodyCreate payload) returns http:Response|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}/renditions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get rendition information for a file version
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + return - Successful response 
    remote isolated function getVersionRendition(string nodeId, string versionId, string renditionId) returns RenditionEntry|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}/renditions/${getEncodedUri(renditionId)}`;
        RenditionEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get rendition content for a file version
    #
    # + nodeId - The identifier of a node. 
    # + versionId - The identifier of a version, ie. version label, within the version history of a node. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + placeholder - If **true** and there is no rendition for this **nodeId** and **renditionId**, then the placeholder image for the mime type of this rendition is returned, rather than a 404 response. 
    # + return - Successful response 
    remote isolated function getVersionRenditionContent(string nodeId, string versionId, string renditionId, boolean attachment = true, string? ifModifiedSince = (), string? range = (), boolean placeholder = false) returns string|error? {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/versions/${getEncodedUri(versionId)}/renditions/${getEncodedUri(renditionId)}/content`;
        map<anydata> queryParam = {"attachment": attachment, "placeholder": placeholder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve actions for a node
    #
    # + nodeId - The identifier of a node. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function nodeActions(string nodeId, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? fields = ()) returns ActionDefinitionList|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/action-definitions`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ActionDefinitionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List deleted nodes
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * association * isLink * isFavorite * isLocked * path * properties * permissions 
    # + return - Successful response 
    remote isolated function listDeletedNodes(int skipCount = 0, int maxItems = 100, string[]? include = ()) returns DeletedNodesPaging|error {
        string resourcePath = string `/deleted-nodes`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "include": include};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DeletedNodesPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a deleted node
    #
    # + nodeId - The identifier of a node. 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isFavorite * isLocked * path * permissions * definition 
    # + return - Successful response 
    remote isolated function getDeletedNode(string nodeId, string[]? include = ()) returns DeletedNodeEntry|error {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}`;
        map<anydata> queryParam = {"include": include};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DeletedNodeEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Permanently delete a deleted node
    #
    # + nodeId - The identifier of a node. 
    # + return - Successful response 
    remote isolated function deleteDeletedNode(string nodeId) returns http:Response|error {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get deleted node content
    #
    # + nodeId - The identifier of a node. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + return - Successful response 
    remote isolated function getDeletedNodeContent(string nodeId, boolean attachment = true, string? ifModifiedSince = (), string? range = ()) returns string|error? {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}/content`;
        map<anydata> queryParam = {"attachment": attachment};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Restore a deleted node
    #
    # + nodeId - The identifier of a node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The targetParentId if the node is restored to a new location. 
    # + return - Successful response 
    remote isolated function restoreDeletedNode(string nodeId, DeletedNodeBodyRestore payload, string[]? fields = ()) returns NodeEntry|error {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}/restore`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NodeEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List renditions for a deleted node
    #
    # + nodeId - The identifier of a node. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + return - Successful response 
    remote isolated function listDeletedNodeRenditions(string nodeId, string? 'where = ()) returns RenditionPaging|error {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}/renditions`;
        map<anydata> queryParam = {"where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RenditionPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get rendition information for a deleted node
    #
    # + nodeId - The identifier of a node. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + return - Successful response 
    remote isolated function getArchivedNodeRendition(string nodeId, string renditionId) returns RenditionEntry|error {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}/renditions/${getEncodedUri(renditionId)}`;
        RenditionEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get rendition content of a deleted node
    #
    # + nodeId - The identifier of a node. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + placeholder - If **true** and there is no rendition for this **nodeId** and **renditionId**, then the placeholder image for the mime type of this rendition is returned, rather than a 404 response. 
    # + return - Successful response 
    remote isolated function getArchivedNodeRenditionContent(string nodeId, string renditionId, boolean attachment = true, string? ifModifiedSince = (), string? range = (), boolean placeholder = false) returns string|error? {
        string resourcePath = string `/deleted-nodes/${getEncodedUri(nodeId)}/renditions/${getEncodedUri(renditionId)}/content`;
        map<anydata> queryParam = {"attachment": attachment, "placeholder": placeholder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new download
    #
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The nodeIds the content of which will be zipped, which zip will be set as the content of our download node. 
    # + return - The request to create a download node was accepted 
    remote isolated function createDownload(DownloadBodyCreate payload, string[]? fields = ()) returns DownloadEntry|error {
        string resourcePath = string `/downloads`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DownloadEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a download
    #
    # + downloadId - The identifier of a download node. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Download node information 
    remote isolated function getDownload(string downloadId, string[]? fields = ()) returns DownloadEntry|error {
        string resourcePath = string `/downloads/${getEncodedUri(downloadId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DownloadEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancel a download
    #
    # + downloadId - The identifier of a download node. 
    # + return - The request to cancel a download was accepted 
    remote isolated function cancelDownload(string downloadId) returns http:Response|error {
        string resourcePath = string `/downloads/${getEncodedUri(downloadId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List people
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + include - Returns additional information about the person. The following optional fields can be requested: * properties * aspectNames * capabilities 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listPeople(int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? include = (), string[]? fields = ()) returns PersonPaging|error {
        string resourcePath = string `/people`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PersonPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create person
    #
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The person details. 
    # + return - Successful response 
    remote isolated function createPerson(PersonBodyCreate payload, string[]? fields = ()) returns PersonEntry|error {
        string resourcePath = string `/people`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PersonEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a person
    #
    # + personId - The identifier of a person. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getPerson(string personId, string[]? fields = ()) returns PersonEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PersonEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update person
    #
    # + personId - The identifier of a person. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The person details. 
    # + return - Successful response 
    remote isolated function updatePerson(string personId, PersonBodyUpdate payload, string[]? fields = ()) returns PersonEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PersonEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List activities
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + who - A filter to include the user's activities only `me`, other user's activities only `others`' 
    # + siteId - Include only activity feed entries relating to this site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listActivitiesForPerson(string personId, int skipCount = 0, int maxItems = 100, string? who = (), string? siteId = (), string[]? fields = ()) returns ActivityPaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/activities`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "who": who, "siteId": siteId, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ActivityPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List favorite sites
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    # 
    # # Deprecated
    @deprecated
    remote isolated function listFavoriteSitesForPerson(string personId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns SitePaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorite-sites`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SitePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a site favorite
    #
    # + personId - The identifier of a person. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The id of the site to favorite. 
    # + return - Successful response 
    # 
    # # Deprecated
    @deprecated
    remote isolated function createSiteFavorite(string personId, FavoriteSiteBodyCreate payload, string[]? fields = ()) returns FavoriteSiteEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorite-sites`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FavoriteSiteEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a favorite site
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getFavoriteSite(string personId, string siteId, string[]? fields = ()) returns SiteEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorite-sites/${getEncodedUri(siteId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a site favorite
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + return - Successful response 
    # 
    # # Deprecated
    @deprecated
    remote isolated function deleteSiteFavorite(string personId, string siteId) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorite-sites/${getEncodedUri(siteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List favorites
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + include - Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders) * properties 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listFavorites(string personId, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string? 'where = (), string[]? include = (), string[]? fields = ()) returns FavoritePaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorites`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "where": 'where, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FavoritePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a favorite
    #
    # + personId - The identifier of a person. 
    # + include - Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders) * properties 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - An object identifying the entity to be favorited. 
    # + return - Successful response 
    remote isolated function createFavorite(string personId, FavoriteBodyCreate payload, string[]? include = (), string[]? fields = ()) returns FavoriteEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorites`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FavoriteEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a favorite
    #
    # + personId - The identifier of a person. 
    # + favoriteId - The identifier of a favorite. 
    # + include - Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders) * properties 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getFavorite(string personId, string favoriteId, string[]? include = (), string[]? fields = ()) returns FavoriteEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorites/${getEncodedUri(favoriteId)}`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FavoriteEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a favorite
    #
    # + personId - The identifier of a person. 
    # + favoriteId - The identifier of a favorite. 
    # + return - Successful response 
    remote isolated function deleteFavorite(string personId, string favoriteId) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/favorites/${getEncodedUri(favoriteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List network membership
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listNetworksForPerson(string personId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns PersonNetworkPaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/networks`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PersonNetworkPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get network information
    #
    # + personId - The identifier of a person. 
    # + networkId - The identifier of a network. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getNetworkForPerson(string personId, string networkId, string[]? fields = ()) returns PersonNetworkEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/networks/${getEncodedUri(networkId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PersonNetworkEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List preferences
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listPreferences(string personId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns PreferencePaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/preferences`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PreferencePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a preference
    #
    # + personId - The identifier of a person. 
    # + preferenceName - The name of the preference. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getPreference(string personId, string preferenceName, string[]? fields = ()) returns PreferenceEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/preferences/${getEncodedUri(preferenceName)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PreferenceEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List site membership requests
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listSiteMembershipRequestsForPerson(string personId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns SiteMembershipRequestPaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/site-membership-requests`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteMembershipRequestPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a site membership request
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSiteMembershipRequestForPerson(string personId, string siteId, string[]? fields = ()) returns SiteMembershipRequestEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/site-membership-requests/${getEncodedUri(siteId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteMembershipRequestEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a site membership request
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The new message to display 
    # + return - Successful response 
    remote isolated function updateSiteMembershipRequestForPerson(string personId, string siteId, SiteMembershipRequestBodyUpdate payload, string[]? fields = ()) returns SiteMembershipRequestEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/site-membership-requests/${getEncodedUri(siteId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteMembershipRequestEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a site membership request
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + return - Successful response 
    remote isolated function deleteSiteMembershipRequestForPerson(string personId, string siteId) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/site-membership-requests/${getEncodedUri(siteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List site memberships
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + relations - Use the relations parameter to include one or more related entities in a single response. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + return - Successful response 
    remote isolated function listSiteMembershipsForPerson(string personId, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? relations = (), string[]? fields = (), string? 'where = ()) returns SiteRolePaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/sites`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "relations": relations, "fields": fields, "where": 'where};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "relations": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteRolePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a site membership
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + return - Successful response 
    remote isolated function getSiteMembershipForPerson(string personId, string siteId) returns SiteRoleEntry|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/sites/${getEncodedUri(siteId)}`;
        SiteRoleEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a site membership
    #
    # + personId - The identifier of a person. 
    # + siteId - The identifier of a site. 
    # + return - Successful response 
    remote isolated function deleteSiteMembershipForPerson(string personId, string siteId) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/sites/${getEncodedUri(siteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List group memberships
    #
    # + personId - The identifier of a person. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + include - Returns additional information about the group. The following optional fields can be requested: * parentIds * zones 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listGroupMembershipsForPerson(string personId, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? include = (), string? 'where = (), string[]? fields = ()) returns GroupPaging|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/groups`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "include": include, "where": 'where, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GroupPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request password reset
    #
    # + personId - The identifier of a person. 
    # + payload - The client name to send email with app-specific url. 
    # + return - Successful response or even when the **personId** does not exist or the user is disabled by an Administrator 
    remote isolated function requestPasswordReset(string personId, ClientBody payload) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/request-password-reset`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reset password
    #
    # + personId - The identifier of a person. 
    # + payload - The reset password details 
    # + return - Successful response or even when no workflow instance is found with the given **id** or the workflow instance is invalid (already been used or expired) or the given **personId** does not match the person's id requesting the password reset or the given workflow **key** does not match the recovered key. 
    remote isolated function resetPassword(string personId, PasswordResetBody payload) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/reset-password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get avatar image
    #
    # + personId - The identifier of a person. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + placeholder - If **true** and there is no avatar for this **personId** then the placeholder image is returned, rather than a 404 response. 
    # + return - Successful response 
    remote isolated function getAvatarImage(string personId, boolean attachment = true, string? ifModifiedSince = (), boolean placeholder = true) returns string|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/avatar`;
        map<anydata> queryParam = {"attachment": attachment, "placeholder": placeholder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update avatar image
    #
    # + personId - The identifier of a person. 
    # + payload - The binary content 
    # + return - Successful response 
    remote isolated function updateAvatarImage(string personId, byte[] payload) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/avatar`;
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete avatar image
    #
    # + personId - The identifier of a person. 
    # + return - Successful response 
    remote isolated function deleteAvatarImage(string personId) returns http:Response|error {
        string resourcePath = string `/people/${getEncodedUri(personId)}/avatar`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List sites
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + relations - Use the relations parameter to include one or more related entities in a single response. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + return - Successful response 
    remote isolated function listSites(int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? relations = (), string[]? fields = (), string? 'where = ()) returns SitePaging|error {
        string resourcePath = string `/sites`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "relations": relations, "fields": fields, "where": 'where};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "relations": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SitePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a site
    #
    # + skipConfiguration - Flag to indicate whether the Share-specific (surf) configuration files for the site should not be created. 
    # + skipAddToFavorites - Flag to indicate whether the site should not be added to the user's site favorites. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The site details 
    # + return - Successful response 
    remote isolated function createSite(SiteBodyCreate payload, boolean skipConfiguration = false, boolean skipAddToFavorites = false, string[]? fields = ()) returns SiteEntry|error {
        string resourcePath = string `/sites`;
        map<anydata> queryParam = {"skipConfiguration": skipConfiguration, "skipAddToFavorites": skipAddToFavorites, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a site
    #
    # + siteId - The identifier of a site. 
    # + relations - Use the relations parameter to include one or more related entities in a single response. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSite(string siteId, string[]? relations = (), string[]? fields = ()) returns SiteEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}`;
        map<anydata> queryParam = {"relations": relations, "fields": fields};
        map<Encoding> queryParamEncoding = {"relations": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a site
    #
    # + siteId - The identifier of a site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The site information to update. 
    # + return - Successful response 
    remote isolated function updateSite(string siteId, SiteBodyUpdate payload, string[]? fields = ()) returns SiteEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a site
    #
    # + siteId - The identifier of a site. 
    # + permanent - Flag to indicate whether the site should be permanently deleted i.e. bypass the trashcan. 
    # + return - Successful response 
    remote isolated function deleteSite(string siteId, boolean permanent = false) returns http:Response|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}`;
        map<anydata> queryParam = {"permanent": permanent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List site containers
    #
    # + siteId - The identifier of a site. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listSiteContainers(string siteId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns SiteContainerPaging|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/containers`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteContainerPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a site container
    #
    # + siteId - The identifier of a site. 
    # + containerId - The unique identifier of a site container. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSiteContainer(string siteId, string containerId, string[]? fields = ()) returns SiteContainerEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/containers/${getEncodedUri(containerId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteContainerEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get site membership requests
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSiteMembershipRequests(int skipCount = 0, int maxItems = 100, string? 'where = (), string[]? fields = ()) returns SiteMembershipRequestWithPersonPaging|error {
        string resourcePath = string `/site-membership-requests`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "where": 'where, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteMembershipRequestWithPersonPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Approve a site membership request
    #
    # + siteId - The identifier of a site. 
    # + inviteeId - The invitee user name. 
    # + payload - Accepting a request to join, optionally, allows assignment of a role to the user. 
    # + return - Successful response 
    remote isolated function approveSiteMembershipRequest(string siteId, string inviteeId, SiteMembershipApprovalBody payload) returns http:Response|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/site-membership-requests/${getEncodedUri(inviteeId)}/approve`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reject a site membership request
    #
    # + siteId - The identifier of a site. 
    # + inviteeId - The invitee user name. 
    # + payload - Rejecting a request to join, optionally, allows the inclusion of comment. 
    # + return - Successful response 
    remote isolated function rejectSiteMembershipRequest(string siteId, string inviteeId, SiteMembershipRejectionBody payload) returns http:Response|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/site-membership-requests/${getEncodedUri(inviteeId)}/reject`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List site memberships
    #
    # + siteId - The identifier of a site. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + 'where - Optionally filter the list. *   ```where=(isMemberOfGroup=false|true)``` 
    # + return - Successful response 
    remote isolated function listSiteMemberships(string siteId, int skipCount = 0, int maxItems = 100, string[]? fields = (), string? 'where = ()) returns SiteMemberPaging|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/members`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields, "where": 'where};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteMemberPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a site membership
    #
    # + siteId - The identifier of a site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The person to add and their role 
    # + return - Successful response 
    remote isolated function createSiteMembership(string siteId, SiteMembershipBodyCreate payload, string[]? fields = ()) returns SiteMemberEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/members`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteMemberEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a site membership
    #
    # + siteId - The identifier of a site. 
    # + personId - The identifier of a person. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSiteMembership(string siteId, string personId, string[]? fields = ()) returns SiteMemberEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/members/${getEncodedUri(personId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteMemberEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a site membership
    #
    # + siteId - The identifier of a site. 
    # + personId - The identifier of a person. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The persons new role 
    # + return - Successful response 
    remote isolated function updateSiteMembership(string siteId, string personId, SiteMembershipBodyUpdate payload, string[]? fields = ()) returns SiteMemberEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/members/${getEncodedUri(personId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteMemberEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a site membership
    #
    # + siteId - The identifier of a site. 
    # + personId - The identifier of a person. 
    # + return - Successful response 
    remote isolated function deleteSiteMembership(string siteId, string personId) returns http:Response|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/members/${getEncodedUri(personId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List group membership for site
    #
    # + siteId - The identifier of a site. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listSiteGroups(string siteId, int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns SiteGroupPaging|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/group-members`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteGroupPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a site membership for group
    #
    # + siteId - The identifier of a site. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The group to add and their role 
    # + return - Successful response 
    remote isolated function createSiteGroupMembership(string siteId, SiteMembershipBodyCreate payload, string[]? fields = ()) returns SiteGroupEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/group-members`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteGroupEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get information about site membership of group
    #
    # + siteId - The identifier of a site. 
    # + groupId - The identifier of a group. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSiteGroupMembership(string siteId, string groupId, string[]? fields = ()) returns SiteGroupEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/group-members/${getEncodedUri(groupId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SiteGroupEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update site membership of group
    #
    # + siteId - The identifier of a site. 
    # + groupId - The identifier of a group. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The groupId new role 
    # + return - Successful response 
    remote isolated function updateSiteGroupMembership(string siteId, string groupId, SiteMembershipBodyUpdate payload, string[]? fields = ()) returns SiteGroupEntry|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/group-members/${getEncodedUri(groupId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteGroupEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a group membership for site
    #
    # + siteId - The identifier of a site. 
    # + groupId - The identifier of a group. 
    # + return - Successful response 
    remote isolated function deleteSiteGroupMembership(string siteId, string groupId) returns http:Response|error {
        string resourcePath = string `/sites/${getEncodedUri(siteId)}/group-members/${getEncodedUri(groupId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List tags
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + include - Returns additional information about the tag. The following optional fields can be requested: * count 
    # + return - Successful response 
    remote isolated function listTags(int skipCount = 0, int maxItems = 100, string[]? fields = (), string[]? include = ()) returns TagPaging|error {
        string resourcePath = string `/tags`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields, "include": include};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TagPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a tag
    #
    # + tagId - The identifier of a tag. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getTag(string tagId, string[]? fields = ()) returns TagEntry|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TagEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a tag
    #
    # + tagId - The identifier of a tag. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The updated tag 
    # + return - Successful response 
    remote isolated function updateTag(string tagId, TagBody payload, string[]? fields = ()) returns TagEntry|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TagEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get a network
    #
    # + networkId - The identifier of a network. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getNetwork(string networkId, string[]? fields = ()) returns PersonNetworkEntry|error {
        string resourcePath = string `/networks/${getEncodedUri(networkId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PersonNetworkEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List shared links
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + 'where - Optionally filter the list by "sharedByUser" userid of person who shared the link (can also use -me-) *   ```where=(sharedByUser='jbloggs')``` *   ```where=(sharedByUser='-me-')``` 
    # + include - Returns additional information about the shared link, the following optional fields can be requested: * allowableOperations * path * properties * isFavorite * aspectNames 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listSharedLinks(int skipCount = 0, int maxItems = 100, string? 'where = (), string[]? include = (), string[]? fields = ()) returns SharedLinkPaging|error {
        string resourcePath = string `/shared-links`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "where": 'where, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SharedLinkPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a shared link to a file
    #
    # + include - Returns additional information about the shared link, the following optional fields can be requested: * allowableOperations * path * properties * isFavorite * aspectNames 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The nodeId to create a shared link for. 
    # + return - Successful response 
    remote isolated function createSharedLink(SharedLinkBodyCreate payload, string[]? include = (), string[]? fields = ()) returns SharedLinkEntry|error {
        string resourcePath = string `/shared-links`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SharedLinkEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a shared link
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getSharedLink(string sharedId, string[]? fields = ()) returns SharedLinkEntry|error {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SharedLinkEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a shared link
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + return - Successful response 
    remote isolated function deleteSharedLink(string sharedId) returns http:Response|error {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get shared link content
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + return - Successful response 
    remote isolated function getSharedLinkContent(string sharedId, boolean attachment = true, string? ifModifiedSince = (), string? range = ()) returns string|error? {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}/content`;
        map<anydata> queryParam = {"attachment": attachment};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List renditions for a shared link
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + return - Successful response 
    remote isolated function listSharedLinkRenditions(string sharedId) returns RenditionPaging|error {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}/renditions`;
        RenditionPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get shared link rendition information
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + return - Successful response 
    remote isolated function getSharedLinkRendition(string sharedId, string renditionId) returns RenditionEntry|error {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}/renditions/${getEncodedUri(renditionId)}`;
        RenditionEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get shared link rendition content
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + renditionId - The name of a thumbnail rendition, for example *doclib*, or *pdf*. 
    # + attachment - **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file. You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files. If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # + ifModifiedSince - Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
    # + range - The Range header indicates the part of a document that the server should return. Single part request supported, for example: bytes=1-10. 
    # + return - Successful response 
    remote isolated function getSharedLinkRenditionContent(string sharedId, string renditionId, boolean attachment = true, string? ifModifiedSince = (), string? range = ()) returns string|error? {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}/renditions/${getEncodedUri(renditionId)}/content`;
        map<anydata> queryParam = {"attachment": attachment};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Modified-Since": ifModifiedSince, "Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Email shared link
    #
    # + sharedId - The identifier of a shared link to a file. 
    # + payload - The shared link email to send. 
    # + return - Successful response 
    remote isolated function emailSharedLink(string sharedId, SharedLinkBodyEmail payload) returns http:Response|error {
        string resourcePath = string `/shared-links/${getEncodedUri(sharedId)}/email`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Check readiness and liveness of the repository
    #
    # + probeId - The name of the probe: * -ready- * -live- 
    # + return - Successful response 
    remote isolated function getProbe(string probeId) returns ProbeEntry|error {
        string resourcePath = string `/probes/${getEncodedUri(probeId)}`;
        ProbeEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find nodes
    #
    # + term - The term to search for. 
    # + rootNodeId - The id of the node to start the search from. Supports the aliases -my-, -root- and -shared-. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + nodeType - Restrict the returned results to only those of the given node type and its sub-types 
    # + include - Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * isLink * isFavorite * isLocked * path * properties 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function findNodes(string term, string? rootNodeId = (), int skipCount = 0, int maxItems = 100, string? nodeType = (), string[]? include = (), string[]? orderBy = (), string[]? fields = ()) returns NodePaging|error {
        string resourcePath = string `/queries/nodes`;
        map<anydata> queryParam = {"term": term, "rootNodeId": rootNodeId, "skipCount": skipCount, "maxItems": maxItems, "nodeType": nodeType, "include": include, "orderBy": orderBy, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "orderBy": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        NodePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find sites
    #
    # + term - The term to search for. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function findSites(string term, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? fields = ()) returns SitePaging|error {
        string resourcePath = string `/queries/sites`;
        map<anydata> queryParam = {"term": term, "skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SitePaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find people
    #
    # + term - The term to search for. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + return - Successful response 
    remote isolated function findPeople(string term, int skipCount = 0, int maxItems = 100, string[]? fields = (), string[]? orderBy = ()) returns PersonPaging|error {
        string resourcePath = string `/queries/people`;
        map<anydata> queryParam = {"term": term, "skipCount": skipCount, "maxItems": maxItems, "fields": fields, "orderBy": orderBy};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "orderBy": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PersonPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List groups
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + include - Returns additional information about the group. The following optional fields can be requested: * parentIds * zones 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listGroups(int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? include = (), string? 'where = (), string[]? fields = ()) returns GroupPaging|error {
        string resourcePath = string `/groups`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "include": include, "where": 'where, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GroupPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a group
    #
    # + include - Returns additional information about the group. The following optional fields can be requested: * parentIds * zones 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The group to create. 
    # + return - Successful response 
    remote isolated function createGroup(GroupBodyCreate payload, string[]? include = (), string[]? fields = ()) returns GroupEntry|error {
        string resourcePath = string `/groups`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get group details
    #
    # + groupId - The identifier of a group. 
    # + include - Returns additional information about the group. The following optional fields can be requested: * parentIds * zones 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getGroup(string groupId, string[]? include = (), string[]? fields = ()) returns GroupEntry|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GroupEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update group details
    #
    # + groupId - The identifier of a group. 
    # + include - Returns additional information about the group. The following optional fields can be requested: * parentIds * zones 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The group information to update. 
    # + return - Successful response 
    remote isolated function updateGroup(string groupId, GroupBodyUpdate payload, string[]? include = (), string[]? fields = ()) returns GroupEntry|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}`;
        map<anydata> queryParam = {"include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupEntry response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a group
    #
    # + groupId - The identifier of a group. 
    # + cascade - If **true** then the delete will be applied in cascade to sub-groups. 
    # + return - Successful response 
    remote isolated function deleteGroup(string groupId, boolean cascade = false) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}`;
        map<anydata> queryParam = {"cascade": cascade};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List memberships of a group
    #
    # + groupId - The identifier of a group. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + 'where - A string to restrict the returned objects by using a predicate. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listGroupMemberships(string groupId, int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string? 'where = (), string[]? fields = ()) returns GroupMemberPaging|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/members`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "where": 'where, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GroupMemberPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a group membership
    #
    # + groupId - The identifier of a group. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The group membership to add (person or sub-group). 
    # + return - Successful response 
    remote isolated function createGroupMembership(string groupId, GroupMembershipBodyCreate payload, string[]? fields = ()) returns GroupMemberEntry|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/members`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupMemberEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a group membership
    #
    # + groupId - The identifier of a group. 
    # + groupMemberId - The identifier of a person or group. 
    # + return - Successful response 
    remote isolated function deleteGroupMembership(string groupId, string groupMemberId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/members/${getEncodedUri(groupMemberId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List audit applications
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listAuditApps(int skipCount = 0, int maxItems = 100, string[]? fields = ()) returns AuditAppPaging|error {
        string resourcePath = string `/audit-applications`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AuditAppPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get audit application info
    #
    # + auditApplicationId - The identifier of an audit application. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + include - Also include the current minimum and/or maximum audit entry ids for the application. The following optional fields can be requested: * max * min 
    # + return - Successful response 
    remote isolated function getAuditApp(string auditApplicationId, string[]? fields = (), string[]? include = ()) returns AuditApp|error {
        string resourcePath = string `/audit-applications/${getEncodedUri(auditApplicationId)}`;
        map<anydata> queryParam = {"fields": fields, "include": include};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AuditApp response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update audit application info
    #
    # + auditApplicationId - The identifier of an audit application. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + payload - The audit application to update. 
    # + return - Successful response 
    remote isolated function updateAuditApp(string auditApplicationId, AuditBodyUpdate payload, string[]? fields = ()) returns AuditApp|error {
        string resourcePath = string `/audit-applications/${getEncodedUri(auditApplicationId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AuditApp response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List audit entries for an audit application
    #
    # + auditApplicationId - The identifier of an audit application. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + omitTotalItems - A boolean to control if the response provides the total numbers of items in the collection. If not supplied then the default value is false. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + 'where - Optionally filter the list. Here are some examples: *   ```where=(createdByUser='jbloggs')``` *   ```where=(id BETWEEN ('1234', '4321')``` *   ```where=(createdAt BETWEEN ('2017-06-02T12:13:51.593+01:00' , '2017-06-04T10:05:16.536+01:00')``` *   ```where=(createdByUser='jbloggs' and createdAt BETWEEN ('2017-06-02T12:13:51.593+01:00' , '2017-06-04T10:05:16.536+01:00')``` *   ```where=(valuesKey='/alfresco-access/login/user')``` *   ```where=(valuesKey='/alfresco-access/transaction/action' and valuesValue='DELETE')``` 
    # + include - Returns additional information about the audit entry. The following optional fields can be requested: * values 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listAuditEntriesForAuditApp(string auditApplicationId, int skipCount = 0, boolean omitTotalItems = false, string[]? orderBy = (), int maxItems = 100, string? 'where = (), string[]? include = (), string[]? fields = ()) returns AuditEntryPaging|error {
        string resourcePath = string `/audit-applications/${getEncodedUri(auditApplicationId)}/audit-entries`;
        map<anydata> queryParam = {"skipCount": skipCount, "omitTotalItems": omitTotalItems, "orderBy": orderBy, "maxItems": maxItems, "where": 'where, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AuditEntryPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Permanently delete audit entries for an audit application
    #
    # + auditApplicationId - The identifier of an audit application. 
    # + 'where - Audit entries to permanently delete for an audit application, given an inclusive time period or range of ids. For example: *   ```where=(createdAt BETWEEN ('2017-06-02T12:13:51.593+01:00' , '2017-06-04T10:05:16.536+01:00')``` *   ```where=(id BETWEEN ('1234', '4321')``` 
    # + return - Successful response 
    remote isolated function deleteAuditEntriesForAuditApp(string auditApplicationId, string 'where) returns http:Response|error {
        string resourcePath = string `/audit-applications/${getEncodedUri(auditApplicationId)}/audit-entries`;
        map<anydata> queryParam = {"where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get audit entry
    #
    # + auditApplicationId - The identifier of an audit application. 
    # + auditEntryId - The identifier of an audit entry. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function getAuditEntry(string auditApplicationId, string auditEntryId, string[]? fields = ()) returns AuditEntryEntry|error {
        string resourcePath = string `/audit-applications/${getEncodedUri(auditApplicationId)}/audit-entries/${getEncodedUri(auditEntryId)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AuditEntryEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Permanently delete an audit entry
    #
    # + auditApplicationId - The identifier of an audit application. 
    # + auditEntryId - The identifier of an audit entry. 
    # + return - Successful response 
    remote isolated function deleteAuditEntry(string auditApplicationId, string auditEntryId) returns http:Response|error {
        string resourcePath = string `/audit-applications/${getEncodedUri(auditApplicationId)}/audit-entries/${getEncodedUri(auditEntryId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List audit entries for a node
    #
    # + nodeId - The identifier of a node. 
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + 'where - Optionally filter the list. Here are some examples: *   ```where=(createdByUser='-me-')``` *   ```where=(createdAt BETWEEN ('2017-06-02T12:13:51.593+01:00' , '2017-06-04T10:05:16.536+01:00')``` *   ```where=(createdByUser='jbloggs' and createdAt BETWEEN ('2017-06-02T12:13:51.593+01:00' , '2017-06-04T10:05:16.536+01:00')``` 
    # + include - Returns additional information about the audit entry. The following optional fields can be requested: * values 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listAuditEntriesForNode(string nodeId, int skipCount = 0, string[]? orderBy = (), int maxItems = 100, string? 'where = (), string[]? include = (), string[]? fields = ()) returns AuditEntryPaging|error {
        string resourcePath = string `/nodes/${getEncodedUri(nodeId)}/audit-entries`;
        map<anydata> queryParam = {"skipCount": skipCount, "orderBy": orderBy, "maxItems": maxItems, "where": 'where, "include": include, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AuditEntryPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve list of available actions
    #
    # + skipCount - The number of entities that exist in the collection before those included in this list. If not supplied then the default value is 0. 
    # + maxItems - The maximum number of items to return in the list. If not supplied then the default value is 100. 
    # + orderBy - A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields. Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order. To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
    # + fields - A list of field names. You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth. The list applies to a returned individual entity or entries within a collection. If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # + return - Successful response 
    remote isolated function listActions(int skipCount = 0, int maxItems = 100, string[]? orderBy = (), string[]? fields = ()) returns ActionDefinitionList|error {
        string resourcePath = string `/action-definitions`;
        map<anydata> queryParam = {"skipCount": skipCount, "maxItems": maxItems, "orderBy": orderBy, "fields": fields};
        map<Encoding> queryParamEncoding = {"orderBy": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ActionDefinitionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the details of an action definition
    #
    # + actionDefinitionId - The identifier of an action definition. 
    # + return - Successful response 
    remote isolated function actionDetails(string actionDefinitionId) returns ActionDefinitionEntry|error {
        string resourcePath = string `/action-definitions/${getEncodedUri(actionDefinitionId)}`;
        ActionDefinitionEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Execute an action
    #
    # + payload - Action execution details 
    # + return - Action execution request accepted and pending execution. 
    remote isolated function actionExec(ActionBodyExec payload) returns ActionExecResultEntry|error {
        string resourcePath = string `/action-executions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ActionExecResultEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
