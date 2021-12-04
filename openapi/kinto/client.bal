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

# This is a generated connector for [Kinto v1.22](https://docs.kinto-storage.org/en/stable/api/index.html) OpenAPI specification.
# The Kinto API provides the capability to store and retrieve JSON data.
@display {label: "Kinto", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization does not require setting the API credentials. 
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://firefox.settings.services.mozilla.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    #
    # + return - Return information about the running Instance. 
    remote isolated function serverInfo() returns json|error {
        string  path = string `/`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    #
    # + return - Return an OpenAPI description of the running instance. 
    remote isolated function getOpenapiSpec() returns json|error {
        string  path = string `/__api__`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    #
    # + return - Server is working properly. 
    remote isolated function heartbeat() returns json|error {
        string  path = string `/__heartbeat__`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    #
    # + return - Returned if server is reachable. 
    remote isolated function lbheartbeat() returns json|error {
        string  path = string `/__lbheartbeat__`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    #
    # + return - Return the running Instance version information. 
    remote isolated function getversion() returns json|error {
        string  path = string `/__version__`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    #
    # + payload - Batch 
    # + return - Return a list of operation responses. 
    remote isolated function batch(BatchPayloadSchema payload) returns BatchResponseBodySchema|error {
        string  path = string `/batch`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseBodySchema response = check self.clientEp->post(path, request, targetType=BatchResponseBodySchema);
        return response;
    }
    #
    # + 'limit - Limit 
    # + sort - Sort 
    # + token - Token 
    # + since - Since 
    # + to - To 
    # + before - Before 
    # + id - ID 
    # + lastModified - Last modified 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return a list of matching objects. 
    remote isolated function getBuckets(int? 'limit = (), string[]? sort = (), string? token = (), int? since = (), int? to = (), int? before = (), string? id = (), int? lastModified = (), string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Schema|error {
        string  path = string `/buckets`;
        map<anydata> queryParam = {"_limit": 'limit, "_sort": sort, "_token": token, "_since": since, "_to": to, "_before": before, "id": id, "last_modified": lastModified, "_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Schema response = check self.clientEp-> get(path, accHeaders, targetType = Schema);
        return response;
    }
    #
    # + 'limit - Limit 
    # + sort - Sort 
    # + token - Token 
    # + since - Since 
    # + to - To 
    # + before - Before 
    # + id - ID 
    # + lastModified - Last modified 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return a list of matching objects. 
    remote isolated function getChanges(int? 'limit = (), string[]? sort = (), string? token = (), int? since = (), int? to = (), int? before = (), string? id = (), int? lastModified = (), string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Schema1|error {
        string  path = string `/buckets/monitor/collections/changes/records`;
        map<anydata> queryParam = {"_limit": 'limit, "_sort": sort, "_token": token, "_since": since, "_to": to, "_before": before, "id": id, "last_modified": lastModified, "_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Schema1 response = check self.clientEp-> get(path, accHeaders, targetType = Schema1);
        return response;
    }
    #
    # + bid - bid 
    # + cid - cid 
    # + expected - Expected 
    # + since - Since 
    # + 'limit - Limit 
    # + bucket - Bucket 
    # + collection - Collection 
    # + return - UNDOCUMENTED RESPONSE 
    remote isolated function getCollectionChangeset(string bid, string cid, string expected, string? since = (), int? 'limit = (), string? bucket = (), string? collection = ()) returns http:Response|error {
        string  path = string `/buckets/${bid}/collections/${cid}/changeset`;
        map<anydata> queryParam = {"_since": since, "_expected": expected, "_limit": 'limit, "bucket": bucket, "collection": collection};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + 'limit - Limit 
    # + sort - Sort 
    # + token - Token 
    # + since - Since 
    # + to - To 
    # + before - Before 
    # + id - ID 
    # + lastModified - Last modified 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return a list of matching objects. 
    remote isolated function getCollections(string bucketId, int? 'limit = (), string[]? sort = (), string? token = (), int? since = (), int? to = (), int? before = (), string? id = (), int? lastModified = (), string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Schema2|error {
        string  path = string `/buckets/${bucketId}/collections`;
        map<anydata> queryParam = {"_limit": 'limit, "_sort": sort, "_token": token, "_since": since, "_to": to, "_before": before, "id": id, "last_modified": lastModified, "_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Schema2 response = check self.clientEp-> get(path, accHeaders, targetType = Schema2);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + collectionId - Collection ID 
    # + 'limit - Limit 
    # + sort - Sort 
    # + token - Token 
    # + since - Since 
    # + to - To 
    # + before - Before 
    # + id - ID 
    # + lastModified - Last modified 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return a list of matching objects. 
    remote isolated function getRecords(string bucketId, string collectionId, int? 'limit = (), string[]? sort = (), string? token = (), int? since = (), int? to = (), int? before = (), string? id = (), int? lastModified = (), string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Schema3|error {
        string  path = string `/buckets/${bucketId}/collections/${collectionId}/records`;
        map<anydata> queryParam = {"_limit": 'limit, "_sort": sort, "_token": token, "_since": since, "_to": to, "_before": before, "id": id, "last_modified": lastModified, "_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Schema3 response = check self.clientEp-> get(path, accHeaders, targetType = Schema3);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + collectionId - Collection ID 
    # + id - ID 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return the target object. 
    remote isolated function getRecord(string bucketId, string collectionId, string id, string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns ObjectSchema|error {
        string  path = string `/buckets/${bucketId}/collections/${collectionId}/records/${id}`;
        map<anydata> queryParam = {"_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ObjectSchema response = check self.clientEp-> get(path, accHeaders, targetType = ObjectSchema);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + collectionId - Collection ID 
    # + id - ID 
    # + return - UNDOCUMENTED RESPONSE 
    remote isolated function createAttachment(string bucketId, string collectionId, string id) returns http:Response|error {
        string  path = string `/buckets/${bucketId}/collections/${collectionId}/records/${id}/attachment`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + collectionId - Collection ID 
    # + id - ID 
    # + return - UNDOCUMENTED RESPONSE 
    remote isolated function deleteAttachment(string bucketId, string collectionId, string id) returns http:Response|error {
        string  path = string `/buckets/${bucketId}/collections/${collectionId}/records/${id}/attachment`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + id - ID 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return the target object. 
    remote isolated function getCollection(string bucketId, string id, string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Objectschema1|error {
        string  path = string `/buckets/${bucketId}/collections/${id}`;
        map<anydata> queryParam = {"_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Objectschema1 response = check self.clientEp-> get(path, accHeaders, targetType = Objectschema1);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + 'limit - Limit 
    # + sort - Sort 
    # + token - Token 
    # + since - Since 
    # + to - To 
    # + before - Before 
    # + id - ID 
    # + lastModified - Last modified 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return a list of matching objects. 
    remote isolated function getGroups(string bucketId, int? 'limit = (), string[]? sort = (), string? token = (), int? since = (), int? to = (), int? before = (), string? id = (), int? lastModified = (), string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Schema4|error {
        string  path = string `/buckets/${bucketId}/groups`;
        map<anydata> queryParam = {"_limit": 'limit, "_sort": sort, "_token": token, "_since": since, "_to": to, "_before": before, "id": id, "last_modified": lastModified, "_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Schema4 response = check self.clientEp-> get(path, accHeaders, targetType = Schema4);
        return response;
    }
    #
    # + bucketId - Bucket ID 
    # + id - ID 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return the target object. 
    remote isolated function getGroup(string bucketId, string id, string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Objectschema2|error {
        string  path = string `/buckets/${bucketId}/groups/${id}`;
        map<anydata> queryParam = {"_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Objectschema2 response = check self.clientEp-> get(path, accHeaders, targetType = Objectschema2);
        return response;
    }
    #
    # + id - ID 
    # + fields - Fields 
    # + ifMatch - If match 
    # + ifNoneMatch - If none match 
    # + return - Return the target object. 
    remote isolated function getBucket(string id, string[]? fields = (), string? ifMatch = (), string? ifNoneMatch = ()) returns Objectschema3|error {
        string  path = string `/buckets/${id}`;
        map<anydata> queryParam = {"_fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Objectschema3 response = check self.clientEp-> get(path, accHeaders, targetType = Objectschema3);
        return response;
    }
    #
    # + return - Return open source contributing information. 
    remote isolated function contribute() returns json|error {
        string  path = string `/contribute.json`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    #
    # + prefix - Prefix 
    # + apiVer - API Version 
    # + applicationGuid - Application GUID 
    # + applicationVer - Application version 
    # + metrics - Mertics 
    # + apiVerD - Automatically added 
    # + metricsParam - Automatically added 
    # + return - UNDOCUMENTED RESPONSE 
    remote isolated function getBlocklist(string prefix, string apiVer, string applicationGuid, string applicationVer, string metrics, string apiVerD, string metricsParam) returns http:Response|error {
        string  path = string `/${prefix}/${apiVerD}/${applicationGuid}/${applicationVer}/${metricsParam}`;
        map<anydata> queryParam = {"api_ver": apiVer, "metrics": metrics};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
