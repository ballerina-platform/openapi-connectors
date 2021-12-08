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

# This is a generated connector for [WorkDay Compensation REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The Workday compensation service enables applications to extend Workday's HCM compensation features.
@display {label: "Workday Compensation", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Provides the ability to set up and retrieve Scores on Scorecard Results.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getScorecardResults(int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string path = string `/scorecardResults`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(path, targetType = InlineResponse200);
        return response;
    }
    # Creates a new Scorecard Result.
    #
    # + return - Resource created. 
    remote isolated function createsNewScorecardResults(CreateScorecardResults payload) returns CreateScorecardResults|error {
        string path = string `/scorecardResults`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateScorecardResults response = check self.clientEp->post(path, request, targetType = CreateScorecardResults);
        return response;
    }
    # Retrieves Compensation Scorecard information.
    #
    # + effectiveDate - Effective date the scorecard task takes effect. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCompensationScorecards(string? effectiveDate = (), int? 'limit = (), int? offset = ()) returns InlineResponse2001|error {
        string path = string `/scorecards`;
        map<anydata> queryParam = {"effectiveDate": effectiveDate, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(path, targetType = InlineResponse2001);
        return response;
    }
    # Creates a Compensation Scorecard
    #
    # + effectiveDate - Effective date the scorecard task takes effect. 
    # + return - Resource created. 
    remote isolated function createsCompensationScorecards(CreateScoreCard payload, string? effectiveDate = ()) returns CreateScoreCard|error {
        string path = string `/scorecards`;
        map<anydata> queryParam = {"effectiveDate": effectiveDate};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateScoreCard response = check self.clientEp->post(path, request, targetType = CreateScoreCard);
        return response;
    }
    # Retrieves a worker instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerInstance(string id) returns WorkerProfile|error {
        string path = string `/workers/${id}`;
        WorkerProfile response = check self.clientEp->get(path, targetType = WorkerProfile);
        return response;
    }
    # Provides the ability to set up and retrieve Scores on Scorecard Results.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAndSetUpScoresOnScorecardResults(string id) returns ScoresetContainer|error {
        string path = string `/scorecardResults/${id}`;
        ScoresetContainer response = check self.clientEp->get(path, targetType = ScoresetContainer);
        return response;
    }
    # Deletes the Scorecard Results with the specified ID.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Deleting resource. 
    remote isolated function deleteScorecardResultsByID(string id) returns http:Response|error {
        string path = string `/scorecardResults/${id}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Retrieves a collection of workers.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + search - Searches ~workers~ by name. The search is case-insensitive. You can include space-delimited search strings for an OR search. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerCollection(int? 'limit = (), int? offset = (), string? search = ()) returns InlineResponse2002|error {
        string path = string `/workers`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "search": search};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(path, targetType = InlineResponse2002);
        return response;
    }
    # Request a one-time payment for a worker with the specified ID.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function requestOneTimePayment(string id, OneTimePaymentPlanEventInput payload) returns OneTimePaymentPlanEventInput|error {
        string path = string `/workers/${id}/requestOneTimePayment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OneTimePaymentPlanEventInput response = check self.clientEp->post(path, request, targetType = OneTimePaymentPlanEventInput);
        return response;
    }
    # Updates the Score for the specified Scorecard Result.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. Updating resource. 
    remote isolated function updateScore(string id, string subresourceID, ScoreInput payload) returns ScoreInput|error {
        string path = string `/scorecardResults/${id}/scores/${subresourceID}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreInput response = check self.clientEp->patch(path, request, targetType = ScoreInput);
        return response;
    }
    # Retrieves Compensation Scorecard information.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCompensationScoreCardInfo(string id) returns ScoreCard|error {
        string path = string `/scorecards/${id}`;
        ScoreCard response = check self.clientEp->get(path, targetType = ScoreCard);
        return response;
    }
    # Updates a Compensation Scorecard
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Updating resource. 
    remote isolated function updateCompensationScorecard(string id, EditScoreCards payload) returns EditScoreCards|error {
        string path = string `/scorecards/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EditScoreCards response = check self.clientEp->put(path, request, targetType = EditScoreCards);
        return response;
    }
    # Deletes a Compensation Scorecard with the specified ID.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Deleting resource. 
    remote isolated function deleteCompensationScorecardByID(string id) returns http:Response|error {
        string path = string `/scorecards/${id}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
}
