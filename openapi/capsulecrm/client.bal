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

# This is a generated connector for [Capsule CRM API v2](https://developer.capsulecrm.com/v2/overview/getting-started) OpenAPI specification.
# Capsule CRM keeps track of the people and companies you do business with, opportunities in the pipeline and what needs to be done.
@display {label: "Capsule CRM", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Capsule CRM account](https://capsulecrm.com) and obtain tokens by following [this guide](https://developer.capsulecrm.com/v2/overview/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.capsulecrm.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves the collection of Cases on the Capsule account.
    #
    # + since - If set then includes only entities that have been changed after this date. Must in be ISO8601 format. 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value). 
    # + return - An object with a single property kases which is an array of Case objects. 
    remote isolated function listCases(string? since = (), int? page = (), int? perPage = (), string? embed = ()) returns Cases|error {
        string path = string `/api/v2/kases`;
        map<anydata> queryParam = {"since": since, "page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Cases response = check self.clientEp->get(path, targetType = Cases);
        return response;
    }
    # Creates a new case.
    #
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value).  
    # + payload - An object with a single property kase which must be a Case object. Note that one or more tracks can be applied to the case by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new cases only, and tracks is not a field of Case objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both. 
    # + return - Created case stored in Capsule 
    remote isolated function createCase(CreateCaseRequest payload, string? embed = ()) returns CreatedCase|error {
        string path = string `/api/v2/kases`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedCase response = check self.clientEp->post(path, request, targetType = CreatedCase);
        return response;
    }
    # Search for cases on the Capsule account. This will return the same results as the global search inside Capsule.
    #
    # + q - The value to search for e.g. a name, a postcode or a phone number. 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value). 
    # + return - An object with a single property kases which is an array of Case objects. 
    remote isolated function searchCases(string? q = (), int? page = (), int? perPage = (), string? embed = ()) returns Cases|error {
        string path = string `/api/v2/kases/search`;
        map<anydata> queryParam = {"q": q, "page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Cases response = check self.clientEp->get(path, targetType = Cases);
        return response;
    }
    # Show a specific case.
    #
    # + caseId - The case ID 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value). 
    # + return - A Case object. 
    remote isolated function showCase(string caseId, string? embed = ()) returns CaseObject|error {
        string path = string `/api/v2/kases/${caseId}`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        CaseObject response = check self.clientEp->get(path, targetType = CaseObject);
        return response;
    }
    # Retrieves the collection of all cases associated with the given party.
    #
    # + partyId - The party ID 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value). 
    # + return - An object with a single property kases which is an array of Case objects. 
    remote isolated function listCasesByParty(string partyId, int? page = (), int? perPage = (), string? embed = ()) returns Cases|error {
        string path = string `/api/v2/parties/${partyId}/kases`;
        map<anydata> queryParam = {"page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Cases response = check self.clientEp->get(path, targetType = Cases);
        return response;
    }
    # Retrieves the collection of Opportunities on the Capsule account.
    #
    # + since - If set then includes only entities that have been changed after this date. Must in be ISO8601 format. 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), party (assigned party), milestone (the opportunity milestone), and missingImportantFields (indicates if an opportunity has any Important custom fields that are missing a value). 
    # + return - An object with a single property opportunity which is an array of Opportunity objects. 
    remote isolated function listOpportunities(string? since = (), int? page = (), int? perPage = (), string? embed = ()) returns Opportunities|error {
        string path = string `/api/v2/opportunities`;
        map<anydata> queryParam = {"since": since, "page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Opportunities response = check self.clientEp->get(path, targetType = Opportunities);
        return response;
    }
    # Creates a new opportunity.
    #
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value).  
    # + payload - An object with a single property opportunity which must be an Opportunity object. One or more tracks can be applied to the opportunity by including the relevant track ids in a tracks array. This is a convenient shortcut to apply tracks to new opportunities only, and tracks is not a field of Opportunity objects. Tracks can be specified using a definition object or the ID shorthand, or a mixture of both. 
    # + return - Created opportunity stored in Capsule 
    remote isolated function createOpportunity(CreateOpportunityRequest payload, string? embed = ()) returns CreatedOpportunity|error {
        string path = string `/api/v2/opportunities`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedOpportunity response = check self.clientEp->post(path, request, targetType = CreatedOpportunity);
        return response;
    }
    # Search for opportunities on the Capsule account. This will return the same results as the global search inside Capsule. If you're looking for a more structured search endpoint you can use Filters to search by a specific field or tag.
    #
    # + q - The value to search for e.g. a name, a postcode or a phone number. 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value). 
    # + return - An object with a single property opportunities which is an array of Opportunity objects. 
    remote isolated function searchOpportunities(string? q = (), int? page = (), int? perPage = (), string? embed = ()) returns Opportunities|error {
        string path = string `/api/v2/opportunities/search`;
        map<anydata> queryParam = {"q": q, "page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Opportunities response = check self.clientEp->get(path, targetType = Opportunities);
        return response;
    }
    # Returns a specific opportunity.
    #
    # + opportunityId - The opportunity ID 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), party (assigned party), milestone (the opportunity milestone), and missingImportantFields (indicates if an opportunity has any Important custom fields that are missing a value). 
    # + return - An Opportunity object. 
    remote isolated function showOpportunity(string opportunityId, string? embed = ()) returns OpportunityObject|error {
        string path = string `/api/v2/opportunities/${opportunityId}`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        OpportunityObject response = check self.clientEp->get(path, targetType = OpportunityObject);
        return response;
    }
    # Updates an existing opportunity.
    #
    # + opportunityId - The opportunity ID 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), party (assigned party), milestone (the opportunity milestone), and missingImportantFields (indicates if an opportunity has any Important custom fields that are missing a value). 
    # + payload - An object with a single property opportunity which must be an Opportunity object. Fields that are not included in the request will remain unchanged. An owner and/or team are required on an opportunity. 
    # + return - All good 
    remote isolated function updateOpportunity(string opportunityId, UpdateOpportunityRequest payload, string? embed = ()) returns http:Response|error {
        string path = string `/api/v2/opportunities/${opportunityId}`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType = http:Response);
        return response;
    }
    # Fully delete a specific opportunity from Capsule.
    #
    # + opportunityId - The opportunity ID 
    # + return - An empty body if the opportunity was successfully deleted. 
    remote isolated function deleteOpportunity(string opportunityId) returns http:Response|error {
        string path = string `/api/v2/opportunities/${opportunityId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Retrieves the collection of all opportunities associated with the given party.
    #
    # + partyId - The party ID 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags ( tags), fields (custom fields and fields in DataTags), party (assigned party), opportunity (the associated opportunity), and missingImportantFields (indicates if a case has any Important custom fields that are missing a value). 
    # + return - An object with a single property opportunities which is an array of Opportunity objects. 
    remote isolated function listOpportunitiesByParty(string partyId, int? page = (), int? perPage = (), string? embed = ()) returns Opportunities|error {
        string path = string `/api/v2/parties/${partyId}/opportunities`;
        map<anydata> queryParam = {"page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Opportunities response = check self.clientEp->get(path, targetType = Opportunities);
        return response;
    }
    # Retrieves the collection of Parties on the Capsule account.
    #
    # + since - If set then includes only entities that have been changed after this date. Must in be ISO8601 format. 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), organisation (extended organisation details for people), and missingImportantFields (indicates if a party has any Important custom fields that are missing a value). 
    # + return - An object with a single property parties which is an array of Party objects. 
    remote isolated function listParties(string? since = (), int? page = (), int? perPage = (), string? embed = ()) returns Parties|error {
        string path = string `/api/v2/parties`;
        map<anydata> queryParam = {"since": since, "page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Parties response = check self.clientEp->get(path, targetType = Parties);
        return response;
    }
    # Creates a new party.
    #
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), organisation (extended organisation details for people), and missingImportantFields (indicates if a party has any Important custom fields that are missing a value). 
    # + payload - An object with a single property party which must be a Party object. 
    # + return - Created party stored in Capsule 
    remote isolated function createParty(CreatePartyRequest payload, string? embed = ()) returns CreatedParty|error {
        string path = string `/api/v2/parties`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedParty response = check self.clientEp->post(path, request, targetType = CreatedParty);
        return response;
    }
    # Search for parties on the Capsule account. This will return the same results as the global search inside Capsule.
    #
    # + q - The value to search for e.g. a name, a postcode or a phone number. 
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), organisation (extended organisation details for people), and missingImportantFields (indicates if a party has any Important custom fields that are missing a value). 
    # + return - An object with a single property parties which is an array of Party objects. 
    remote isolated function searchParties(string? q = (), int? page = (), int? perPage = (), string? embed = ()) returns Parties|error {
        string path = string `/api/v2/parties/search`;
        map<anydata> queryParam = {"q": q, "page": page, "perPage": perPage, "embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        Parties response = check self.clientEp->get(path, targetType = Parties);
        return response;
    }
    # Show a specific person or organisation.
    #
    # + partyId - The party ID 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), organisation (extended organisation details for people), and missingImportantFields (indicates if a party has any Important custom fields that are missing a value). 
    # + return - An object with a single property party which will contain a Party object. 
    remote isolated function showParty(string partyId, string? embed = ()) returns PartyObject|error {
        string path = string `/api/v2/parties/${partyId}`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        PartyObject response = check self.clientEp->get(path, targetType = PartyObject);
        return response;
    }
    # Update an existing party.
    #
    # + partyId - The party ID 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are tags (tags), fields (custom fields and fields in DataTags), organisation (extended organisation details for people), and missingImportantFields (indicates if a party has any Important custom fields that are missing a value). 
    # + payload - object with a single property party which must be a Party object. Fields that are not included in the request will remain unchanged. 
    # + return - All good 
    remote isolated function updateParty(string partyId, UpdatePartyRequest payload, string? embed = ()) returns http:Response|error {
        string path = string `/api/v2/parties/${partyId}`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType = http:Response);
        return response;
    }
    # Fully delete the specific party from Capsule.
    #
    # + partyId - The party ID 
    # + return - An empty body if the party was successfully deleted. 
    remote isolated function deleteParty(string partyId) returns http:Response|error {
        string path = string `/api/v2/parties/${partyId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Retrieves the collection of Tasks on the Capsule account. By default the body will contain only the open tasks. If you want to retrieve pending and/or completed tasks use the status query parameter.
    #
    # + page - The page of results to return. Default: 1 
    # + perPage - The number of entities to return per page. Value must be between 1 and 100. Default: 50 
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are party (the party this task is assigned to), opportunity (opportunity this task is on), kase (the case this task is on), owner (the owner of the task) and nextTask (the next task). 
    # + status - Filter the response based on the status of the task. Must be a comma separated list of strings. Accepted values are open, completed and pending. 
    # + return - An object with a single property tasks which is an array of Task objects. 
    remote isolated function listTasks(int? page = (), int? perPage = (), string? embed = (), string? status = ()) returns Tasks|error {
        string path = string `/api/v2/tasks`;
        map<anydata> queryParam = {"page": page, "perPage": perPage, "embed": embed, "status": status};
        path = path + check getPathForQueryParam(queryParam);
        Tasks response = check self.clientEp->get(path, targetType = Tasks);
        return response;
    }
    # Creates a new task.
    #
    # + embed - Can be used to request additional data that aren’t included in the response by default. If provided, should be a comma separated list of strings. Supported values for this endpoint are party (the party this task is assigned to), opportunity (opportunity this task is on), kase (the case this task is on), owner (the owner of the task) and nextTask (the next task). 
    # + payload - An object with a single property task which must be a Task object. 
    # + return - Created task stored in Capsule 
    remote isolated function createTask(CreateTaskRequest payload, string? embed = ()) returns CreatedTask|error {
        string path = string `/api/v2/tasks`;
        map<anydata> queryParam = {"embed": embed};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedTask response = check self.clientEp->post(path, request, targetType = CreatedTask);
        return response;
    }
}
