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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `hapikey`
    string hapikey;
|};

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
@display {label: "HubSpot CRM Feedback", iconPath: "resources/hubspot.crm.feedback.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain the API Key following [this guide](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.162640933)."
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.hubapi.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # List
    #
    # + 'limit - The maximum number of results to display per page. 
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored. 
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored. 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getPage(int 'limit = 10, string? after = (), string[]? properties = (), string[]? associations = (), boolean archived = false) returns CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error {
        string  path = string `/crm/v3/objects/feedback_submissions`;
        map<anydata> queryParam = {"limit": 'limit, "after": after, "properties": properties, "associations": associations, "archived": archived, "hapikey": self.apiKeyConfig.hapikey};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "associations": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionResponseSimplePublicObjectWithAssociationsForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponseSimplePublicObjectWithAssociationsForwardPaging);
        return response;
    }
    # Read a batch of feedback submissions by internal ID, or unique property values
    #
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function batchReadReadBatch(BatchReadInputSimplePublicObjectId payload, boolean archived = false) returns BatchResponseSimplePublicObject|error {
        string  path = string `/crm/v3/objects/feedback_submissions/batch/read`;
        map<anydata> queryParam = {"archived": archived, "hapikey": self.apiKeyConfig.hapikey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseSimplePublicObject response = check self.clientEp->post(path, request, targetType=BatchResponseSimplePublicObject);
        return response;
    }
    # Filter, Sort, and Search CRM Objects
    #
    # + return - successful operation 
    remote isolated function doSearch(PublicObjectSearchRequest payload) returns CollectionResponseWithTotalSimplePublicObjectForwardPaging|error {
        string  path = string `/crm/v3/objects/feedback_submissions/search`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CollectionResponseWithTotalSimplePublicObjectForwardPaging response = check self.clientEp->post(path, request, targetType=CollectionResponseWithTotalSimplePublicObjectForwardPaging);
        return response;
    }
    # Read
    #
    # + feedbackSubmissionId - Feedback submission ID 
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored. 
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored. 
    # + archived - Whether to return only results that have been archived. 
    # + idProperty - The name of a property whose values are unique for this object type 
    # + return - successful operation 
    remote isolated function getById(string feedbackSubmissionId, string[]? properties = (), string[]? associations = (), boolean archived = false, string? idProperty = ()) returns SimplePublicObjectWithAssociations|error {
        string  path = string `/crm/v3/objects/feedback_submissions/${feedbackSubmissionId}`;
        map<anydata> queryParam = {"properties": properties, "associations": associations, "archived": archived, "idProperty": idProperty, "hapikey": self.apiKeyConfig.hapikey};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "associations": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        SimplePublicObjectWithAssociations response = check self.clientEp-> get(path, targetType = SimplePublicObjectWithAssociations);
        return response;
    }
    # List associations of a feedback submission by type
    #
    # + feedbackSubmissionId - Feedback submission ID 
    # + toObjectType - Object type to associate with 
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + return - successful operation 
    remote isolated function associationsGetAll(string feedbackSubmissionId, string toObjectType, string? after = (), int 'limit = 500) returns CollectionResponseAssociatedIdForwardPaging|error {
        string  path = string `/crm/v3/objects/feedback_submissions/${feedbackSubmissionId}/associations/${toObjectType}`;
        map<anydata> queryParam = {"after": after, "limit": 'limit, "hapikey": self.apiKeyConfig.hapikey};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseAssociatedIdForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponseAssociatedIdForwardPaging);
        return response;
    }
}
