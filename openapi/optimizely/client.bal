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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# Connects to [Optimizely API v2](https://www.optimizely.com/) from Ballerina
# Optimizely Agent is a stand-alone, open-source microservice that provides major benefits over using Optimizely SDKs in certain use cases. Its REST API offers consolidated and simplified endpoints for accessing all the functionality of Optimizely Full Stack SDKs. Use this API the control experiments (such as a feature tests).
@display {label: "Optimizely", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Optimizely account](https://www.optimizely.com/) and obtain tokens by following [this guide](https://docs.developers.optimizely.com/web/docs/rest-api-getting-started#section-2-generate-a-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.optimizely.com/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # List Attributes
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The ID of the Project you would like to list all Attributes for 
    # + return - Return all Attributes in the specified Project 
    remote isolated function listAttributes(int projectId, int perPage = 25, int page = 1) returns Attribute[]|error {
        string  path = string `/attributes`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Attribute[] response = check self.clientEp-> get(path, targetType = AttributeArr);
        return response;
    }
    # Create an Attribute
    #
    # + payload - A string in JSON format that includes all the fields to create a new Attribute 
    # + return - Successfully created the Attribute 
    remote isolated function createAttribute(Attribute payload) returns Attribute|error {
        string  path = string `/attributes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attribute response = check self.clientEp->post(path, request, targetType=Attribute);
        return response;
    }
    # Read an Attribute
    #
    # + attributeId - The Attribute ID of the Attribute you want to get 
    # + return - Successfully retrieved Attribute 
    remote isolated function getAttribute(int attributeId) returns Attribute|error {
        string  path = string `/attributes/${attributeId}`;
        Attribute response = check self.clientEp-> get(path, targetType = Attribute);
        return response;
    }
    # Delete an Attribute
    #
    # + attributeId - The ID of the Attribute you'd like to delete 
    # + return - Successfully deleted Attribute 
    remote isolated function deleteAttribute(int attributeId) returns http:Response|error {
        string  path = string `/attributes/${attributeId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update an Attribute
    #
    # + attributeId - The ID of the Attribute you'd like to update 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an Attribute 
    # + return - Successfully updated the Attribute 
    remote isolated function updateAttribute(int attributeId, AttributeUpdate payload) returns Attribute|error {
        string  path = string `/attributes/${attributeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attribute response = check self.clientEp->patch(path, request, targetType=Attribute);
        return response;
    }
    # List Audiences
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The Project ID of the Project you would like to list all Audiences for 
    # + return - Return all Audiences 
    remote isolated function listAudiences(int projectId, int perPage = 25, int page = 1) returns Audience[]|error {
        string  path = string `/audiences`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Audience[] response = check self.clientEp-> get(path, targetType = AudienceArr);
        return response;
    }
    # Create an Audience
    #
    # + payload - A string in JSON format that includes all the fields to create an Audience 
    # + return - Return the created Audience 
    remote isolated function createAudience(Audience payload) returns Audience|error {
        string  path = string `/audiences`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Audience response = check self.clientEp->post(path, request, targetType=Audience);
        return response;
    }
    # Read an Audience
    #
    # + audienceId - The Audience ID of the Audience you want to get 
    # + return - Return Audience info 
    remote isolated function getAudience(int audienceId) returns Audience|error {
        string  path = string `/audiences/${audienceId}`;
        Audience response = check self.clientEp-> get(path, targetType = Audience);
        return response;
    }
    # Update an Audience
    #
    # + audienceId - The Audience ID of the Audience you want to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an Audience 
    # + return - Return the created Audience 
    remote isolated function updateAudience(int audienceId, AudienceUpdate payload) returns Audience|error {
        string  path = string `/audiences/${audienceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Audience response = check self.clientEp->patch(path, request, targetType=Audience);
        return response;
    }
    # Get Impressions Usage
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + accountId - The account ID of the customer 
    # + usageDateFrom - Start date of date range 
    # + usageDateTo - End date of date range 
    # + platforms - The platform of the Project 
    # + query - Search by experiment_id, project_id. 
    # + sort - The property to sort by. 
    # + 'order - The property to sort by. 
    # + return - Return Impression Usage info for account 
    remote isolated function getImpressionsUsageRequest(int accountId, string usageDateFrom, string usageDateTo, int perPage = 25, int page = 1, string[] platforms = ["edge","fullstack","web"], string? query = (), string sort = "impression_count", string 'order = "desc") returns ImpressionsUsage[]|error {
        string  path = string `/billing/usage/${accountId}`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "usage_date_from": usageDateFrom, "usage_date_to": usageDateTo, "platforms": platforms, "query": query, "sort": sort, "order": 'order};
        map<Encoding> queryParamEncoding = {"platforms": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        ImpressionsUsage[] response = check self.clientEp-> get(path, targetType = ImpressionsUsageArr);
        return response;
    }
    # Get Impressions Usage Summary
    #
    # + accountId - The account ID of the customer 
    # + return - Return Impression Usage Summary for account 
    remote isolated function getImpressionsUsageSummaryRequest(int accountId) returns ImpressionsUsageSummary|error {
        string  path = string `/billing/usage/${accountId}/summary`;
        ImpressionsUsageSummary response = check self.clientEp-> get(path, targetType = ImpressionsUsageSummary);
        return response;
    }
    # List Campaigns
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The Project ID of the Project you would like to list all Campaigns for 
    # + return - Return all Campaigns 
    remote isolated function listCampaigns(int projectId, int perPage = 25, int page = 1) returns Campaign[]|error {
        string  path = string `/campaigns`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Campaign[] response = check self.clientEp-> get(path, targetType = CampaignArr);
        return response;
    }
    # Create a Campaign
    #
    # + action - Action to change the state of the Campaign. 'publish' publishes your campaign, making any changes live to the world. Status will be 'paused'. 'start' publishes your campaign, making any changes live to the world. Status will be 'running'. 
    # + payload - A string in JSON format that includes all the fields to create a Project 
    # + return - Return the created Campaign 
    remote isolated function createCampaign(Campaign payload, string? action = ()) returns Campaign|error {
        string  path = string `/campaigns`;
        map<anydata> queryParam = {"action": action};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Campaign response = check self.clientEp->post(path, request, targetType=Campaign);
        return response;
    }
    # Read a Campaign
    #
    # + campaignId - The Campaign ID of the Campaign you want to get 
    # + return - Return Campaign info 
    remote isolated function getCampaign(int campaignId) returns Campaign|error {
        string  path = string `/campaigns/${campaignId}`;
        Campaign response = check self.clientEp-> get(path, targetType = Campaign);
        return response;
    }
    # Delete a Campaign
    #
    # + campaignId - The Campaign ID of the Campaign you want to delete 
    # + return - Deleted Campaign successfully 
    remote isolated function deleteCampaign(int campaignId) returns http:Response|error {
        string  path = string `/campaigns/${campaignId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update a Campaign
    #
    # + campaignId - The Campaign ID of the Campaign you want to change 
    # + action - Action to change the state of the Campaign. 'publish' publishes your campaign, making any changes live to the world without changing the status of the campaign. 'start' publishes your campaign, making any changes live to the world. Status will be 'running'. 'pause' stops the campaign. Status will be 'paused'. No new visitors will see the campaign until it is resumed. 'resume' resumes the campaign from a paused status without publishing any new changes. Status will be 'running'. 'unarchive' unarchives an archived campaign. Status will be 'paused'. 
    # + payload - A string in JSON format that includes all the fields you'd like to change for a Campaign 
    # + return - Return the updated Campaign 
    remote isolated function updateCampaign(int campaignId, CampaignUpdate payload, string? action = ()) returns Campaign|error {
        string  path = string `/campaigns/${campaignId}`;
        map<anydata> queryParam = {"action": action};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Campaign response = check self.clientEp->patch(path, request, targetType=Campaign);
        return response;
    }
    # Get Campaign results
    #
    # + campaignId - The ID for the Campaign you want results for 
    # + startTime - The start time of the time interval (beginning time included) used to calculate the results over. If unspecified, defaults to the time that the Campaign was first activated. The start time will be rounded the smallest time modulo 5 minutes larger or equal to start_time. 
    # + endTime - The end of the time interval (end time excluded) used to calculate results over. If unspecified, defaults to the current time if the Experiment is still running, otherwise defaults to the time the experiment was last active. The end time will be rounded to the largest time modulo 5 minutes smaller or equal to end_time. The end_time in the response may be earlier than requested if fresher results are not available yet. In this case, the results will continue to calculate in the background and subsequent requests will eventually return the full results. 
    # + browser - Browser to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [device, source, attribute_id, attribute_value]. 
    # + device - Device to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, source, attribute_id, attribute_value]. 
    # + 'source - Source to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, device, attribute_id, attribute_value]. Campaign: Contains users that arrive on a URL containing a 'utm_campaign,' 'utm_source,' 'gclid,' or 'otm_source' query parameter. If the URL contains one of these parameters, the visitor will count as "Campaign" traffic even if they arrived through search. Direct:  Includes all users who do not have any external referrer in their URL. Referral: Includes all users that come from another URL that doesn't count as Campaign. 
    # + attributeId - ID of the attribute to segment results by. Requests containing attribute_id will return the results for all visitors that have attribute_value for the attribute represented by attribute_id. If present, the attribute_value parameter must also be present, and it cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + attributeValue - UTF-8 encoded value correlating to attribute_id. If present, the attribute_id parameter must also be present. This parameter also requires attribute_id to be set, and cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + segmentConditions - (BETA) A string representation of a JSON Segment Conditions Expression. This parameter can be either URL-escaped stringified JSON or Base64-encoded stringified JSON using URL-safe alphabet (preferred). Segment Conditions Expressions consist of Logical Expressions and Match Expressions. Logical Expressions are represented as an array of the format [<operator>, <expression>...], where the supported operators are "and", "or" and "not". Match Expressions are represented as an object of the format {"attribute_id": <attribute_id>, "attribute_value": <value>[, "match_type": <match_type>]}, where supported values for match_type are "exact" match type will match only an exact string match between "value" string and the attribute value. "substring" match type will match if "value" is a substring of the attribute value. "prefix" match type will match if "value" is a string prefix of the attribute value. "regex" match type will match if "value" is a regular expression match for the attribute value. The default match_type is "exact". 
    # + return - Return Campaign results 
    remote isolated function getCampaignResults(int campaignId, string? startTime = (), string? endTime = (), string? browser = (), string? device = (), string? 'source = (), int? attributeId = (), string? attributeValue = (), string? segmentConditions = ()) returns CampaignResults|error {
        string  path = string `/campaigns/${campaignId}/results`;
        map<anydata> queryParam = {"start_time": startTime, "end_time": endTime, "browser": browser, "device": device, "source": 'source, "attribute_id": attributeId, "attribute_value": attributeValue, "segment_conditions": segmentConditions};
        path = path + check getPathForQueryParam(queryParam);
        CampaignResults response = check self.clientEp-> get(path, targetType = CampaignResults);
        return response;
    }
    # Retrieve changes for a project.
    #
    # + projectId - ID of the Project you want to list changes for. 
    # + id - A specific Change ID to filter by. Can be specified multiple times to include multiple specific changes. 
    # + startTime - Start of the time interval (inclusive) to list changes. The time is formatted in ISO 8601. 
    # + endTime - End of the time interval (exclusive) to look for changes. The time is formatted in ISO 8601. 
    # + user - Email of the user who made the change. Can be specified multiple times to include changes from multiple users. 
    # + entityType - The type of the entity (with optional subtype delimited by a : (colon) you want to list changes for) e.g. experiment or experiment:feature. Can be specified multiple times to include changes for multiple entity types. 
    # + entity - Colon (:) delimited string containing the entity_type and entity_id of the entity wanted. e.g. experiment:123. Can be specified multiple times to filter changes to a specific set of entities. 
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + return - Returns changes. 
    remote isolated function listChangeHistory(int projectId, int[]? id = (), string? startTime = (), string? endTime = (), string[]? user = (), string[]? entityType = (), string[]? entity = (), int perPage = 25, int page = 1) returns ChangeHistoryChange[]|error {
        string  path = string `/changes`;
        map<anydata> queryParam = {"project_id": projectId, "id": id, "start_time": startTime, "end_time": endTime, "user": user, "entity_type": entityType, "entity": entity, "per_page": perPage, "page": page};
        map<Encoding> queryParamEncoding = {"id": {style: FORM, explode: true}, "user": {style: FORM, explode: true}, "entity_type": {style: FORM, explode: true}, "entity": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        ChangeHistoryChange[] response = check self.clientEp-> get(path, targetType = ChangeHistoryChangeArr);
        return response;
    }
    # Get Environments by Project
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The ID of the project for which you would like to get Environments 
    # + return - Return all Environments in a specified Project 
    remote isolated function listEnvironments(int projectId, int perPage = 25, int page = 1) returns Environment[]|error {
        string  path = string `/environments`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Environment[] response = check self.clientEp-> get(path, targetType = EnvironmentArr);
        return response;
    }
    # Create an Environment
    #
    # + payload - A string in JSON format that includes all the fields to create an Environment 
    # + return - Return the created Environment 
    remote isolated function createEnvironment(Environment payload) returns Environment|error {
        string  path = string `/environments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Environment response = check self.clientEp->post(path, request, targetType=Environment);
        return response;
    }
    # Read an Environment
    #
    # + environmentId - The unique identifier for the Environment 
    # + return - Successfully retrieved the Environment 
    remote isolated function getEnvironment(int environmentId) returns Environment|error {
        string  path = string `/environments/${environmentId}`;
        Environment response = check self.clientEp-> get(path, targetType = Environment);
        return response;
    }
    # Archive an Environment
    #
    # + environmentId - The ID of the Environment you'd like to archive 
    # + return - Successfully archived the Environment 
    remote isolated function deleteEnvironment(int environmentId) returns http:Response|error {
        string  path = string `/environments/${environmentId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update an Environment
    #
    # + environmentId - The unique identifier for the Environment 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an Environment 
    # + return - Successfully updated the Environment 
    remote isolated function updateEnvironment(int environmentId, EnvironmentUpdate payload) returns Environment|error {
        string  path = string `/environments/${environmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Environment response = check self.clientEp->patch(path, request, targetType=Environment);
        return response;
    }
    # Read the datafile of an Environment
    #
    # + environmentId - The Environment ID for the datafile you want to get. 
    # + return - Return Datafile for the Environment specified 
    remote isolated function getDatafile(int environmentId) returns json|error {
        string  path = string `/environments/${environmentId}/datafile`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # List all Events
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The ID of the Project you would like to list all Events for 
    # + includeClassic - Whether or not to include classic Events in the list of Events. If this parameter is not provided it will default to false 
    # + return - List of Events for the supplied Project ID 
    remote isolated function listEvents(int projectId, int perPage = 25, int page = 1, boolean includeClassic = false) returns Event[]|error {
        string  path = string `/events`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId, "include_classic": includeClassic};
        path = path + check getPathForQueryParam(queryParam);
        Event[] response = check self.clientEp-> get(path, targetType = EventArr);
        return response;
    }
    # Get Event by ID
    #
    # + eventId - The Event ID of the Event you want to get 
    # + includeClassic - Whether or not to return a classic Event if the specified event_id belongs to a classic Event. If this parameter is not provided it will default to false 
    # + return - Return Event specified by ID 
    remote isolated function getEvent(int eventId, boolean? includeClassic = ()) returns Event|error {
        string  path = string `/events/${eventId}`;
        map<anydata> queryParam = {"include_classic": includeClassic};
        path = path + check getPathForQueryParam(queryParam);
        Event response = check self.clientEp-> get(path, targetType = Event);
        return response;
    }
    # List Experiments
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The Project ID of the Project you would like to list all Experiments for. You have to either use this argument or the campaign_id argument 
    # + campaignId - The Campaign ID of the Campaign you would like to list all Experiments for. You have to either use this argument or the project_id argument 
    # + includeClassic - Whether or not to include classic Experiments in the list of Experiments. If this parameter is not provided it will default to false 
    # + return - Return all Experiments 
    remote isolated function listExperiments(int perPage = 25, int page = 1, int? projectId = (), int? campaignId = (), boolean includeClassic = false) returns Experiment[]|error {
        string  path = string `/experiments`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId, "campaign_id": campaignId, "include_classic": includeClassic};
        path = path + check getPathForQueryParam(queryParam);
        Experiment[] response = check self.clientEp-> get(path, targetType = ExperimentArr);
        return response;
    }
    # Create an Experiment
    #
    # + action - Action to change the state of the experiment. `publish` saves and stages your experiment. If you have not started your experiment or the experiment is paused, your changes will not be visible to visitors when you publish. `start` makes your experiment live to all visitors who are in your targeted audience and changes the status to `running`. `pause` stops the experiment and changes the status to `paused`. No new visitors will see a `paused` experiment until you restart it. See [Differences among publish, start, and pause](https://help.optimizely.com/Get_Started/Differences_among_publish%2C_start%2C_and_pause) for details. 
    # + payload - A string in JSON format that includes all the fields to create an Experiment 
    # + return - Return the created Experiment 
    remote isolated function createExperiment(Experiment payload, string? action = ()) returns Experiment|error {
        string  path = string `/experiments`;
        map<anydata> queryParam = {"action": action};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Experiment response = check self.clientEp->post(path, request, targetType=Experiment);
        return response;
    }
    # Read an Experiment
    #
    # + experimentId - The Experiment ID of the Experiment you want to get 
    # + return - Return Experiment info 
    remote isolated function getExperiment(int experimentId) returns Experiment|error {
        string  path = string `/experiments/${experimentId}`;
        Experiment response = check self.clientEp-> get(path, targetType = Experiment);
        return response;
    }
    # Delete an Experiment
    #
    # + experimentId - The Experiment ID of the Experiment you want to delete 
    # + return - Deleted Experiment successfully 
    remote isolated function deleteExperiment(int experimentId) returns http:Response|error {
        string  path = string `/experiments/${experimentId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update an Experiment
    #
    # + experimentId - The Experiment ID of the Experiment you want to change 
    # + action - Action to change the state of the experiment. `publish` saves and stages your experiment. If you have not started your experiment or the experiment is paused, your changes will not be visible to visitors when you publish. `start` makes your experiment live to all visitors who are in your targeted audience and changes the status to `running`. `pause` stops the experiment and changes the status to `paused`. No new visitors will see a `paused` experiment until you restart it. See [Differences among publish, start, and pause](https://help.optimizely.com/Get_Started/Differences_among_publish%2C_start%2C_and_pause) for details. `resume` resumes the experiment from a paused status without publishing any new changes. Status will be `running`. `unarchive` unarchives an archived experiment. Status will be `paused`. 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an Experiment 
    # + return - Successfully updated Experiment 
    remote isolated function updateExperiment(int experimentId, ExperimentUpdate payload, string? action = ()) returns Experiment|error {
        string  path = string `/experiments/${experimentId}`;
        map<anydata> queryParam = {"action": action};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Experiment response = check self.clientEp->patch(path, request, targetType=Experiment);
        return response;
    }
    # Get Experiment results
    #
    # + experimentId - The ID for the Experiment you want results for 
    # + baselineVariationId - The ID of the variation to use as the baseline to compare against other variations. Defaults to the first variation if not provided. For an experience in a personalization campaign, the value can also be the string 'holdback'. 
    # + startTime - The start time of the time interval (beginning time included) used to calculate the results over. If unspecified, defaults to the time that the Experiment was first activated. The start time will be rounded the smallest time modulo 5 minutes larger or equal to start_time. 
    # + endTime - The end of the time interval (end time excluded) used to calculate results over. If unspecified, defaults to the current time if the Experiment is still running, otherwise defaults to the time the experiment was last active. The end time will be rounded to the largest time modulo 5 minutes smaller or equal to end_time. The end_time in the response may be earlier than requested if fresher results are not available yet. In this case, the results will continue to calculate in the background and subsequent requests will eventually return the full results. 
    # + browser - Browser to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [device, source, attribute_id, attribute_value]. 
    # + device - Device to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, source, attribute_id, attribute_value]. 
    # + 'source - Source to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, device, attribute_id, attribute_value]. Campaign: Contains users that arrive on a URL containing a 'utm_campaign,' 'utm_source,' 'gclid,' or 'otm_source' query parameter. If the URL contains one of these parameters, the visitor will count as "Campaign" traffic even if they arrived through search. Direct:  Includes all users who do not have any external referrer in their URL. Referral: Includes all users that come from another URL that doesn't count as Campaign. 
    # + attributeId - ID of the attribute to segment results by. Requests containing attribute_id will return the results for all visitors that have attribute_value for the attribute represented by attribute_id. If present, the attribute_value parameter must also be present, and it cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + attributeValue - UTF-8 encoded value correlating to attribute_id. If present, the attribute_id parameter must also be present. This parameter also requires attribute_id to be set, and cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + segmentConditions - (BETA) A string representation of a JSON Segment Conditions Expression. This parameter can be either URL-escaped stringified JSON or Base64-encoded stringified JSON using URL-safe alphabet (preferred). Segment Conditions Expressions consist of Logical Expressions and Match Expressions. Logical Expressions are represented as an array of the format [<operator>, <expression>...], where the supported operators are "and", "or" and "not". Match Expressions are represented as an object of the format {"attribute_id": <attribute_id>, "attribute_value": <value>[, "match_type": <match_type>]}, where supported values for match_type are "exact" match type will match only an exact string match between "value" string and the attribute value. "substring" match type will match if "value" is a substring of the attribute value. "prefix" match type will match if "value" is a string prefix of the attribute value. "regex" match type will match if "value" is a regular expression match for the attribute value. The default match_type is "exact". 
    # + return - Return Experiment results 
    remote isolated function getExperimentResults(int experimentId, string? baselineVariationId = (), string? startTime = (), string? endTime = (), string? browser = (), string? device = (), string? 'source = (), int? attributeId = (), string? attributeValue = (), string? segmentConditions = ()) returns ExperimentResults|error {
        string  path = string `/experiments/${experimentId}/results`;
        map<anydata> queryParam = {"baseline_variation_id": baselineVariationId, "start_time": startTime, "end_time": endTime, "browser": browser, "device": device, "source": 'source, "attribute_id": attributeId, "attribute_value": attributeValue, "segment_conditions": segmentConditions};
        path = path + check getPathForQueryParam(queryParam);
        ExperimentResults response = check self.clientEp-> get(path, targetType = ExperimentResults);
        return response;
    }
    # Read all the Sections in a Multivariate Test
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + experimentId - The Experiment ID of the Multivariate Test you want to get Sections for 
    # + return - Return Sections 
    remote isolated function getExperimentSections(int experimentId, int perPage = 25, int page = 1) returns Section[]|error {
        string  path = string `/experiments/${experimentId}/sections`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        Section[] response = check self.clientEp-> get(path, targetType = SectionArr);
        return response;
    }
    # Create a new Section in a Multivariate Test
    #
    # + experimentId - The Experiment ID of the Multivariate Test you want to create a Section in 
    # + payload - A string in JSON format that includes all the fields to create a Section 
    # + return - Section Created 
    remote isolated function createSection(int experimentId, Section payload) returns Section|error {
        string  path = string `/experiments/${experimentId}/sections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Section response = check self.clientEp->post(path, request, targetType=Section);
        return response;
    }
    # Read a Section of a Multivariate Test
    #
    # + sectionId - The ID of the Section you want to read 
    # + experimentId - The ID of the Multivariate Test the requested Section is part of 
    # + return - Return Section info 
    remote isolated function getSection(int sectionId, int experimentId) returns Section|error {
        string  path = string `/experiments/${experimentId}/sections/${sectionId}`;
        Section response = check self.clientEp-> get(path, targetType = Section);
        return response;
    }
    # Archive a Section by ID
    #
    # + sectionId - The ID of the Section you want to archive within the given Experiment 
    # + experimentId - The ID of the Multivariate Test the requested Section is part of 
    # + return - Successfully archived Section 
    remote isolated function deleteSection(int sectionId, int experimentId) returns http:Response|error {
        string  path = string `/experiments/${experimentId}/sections/${sectionId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update a Section by ID
    #
    # + sectionId - The ID of the Section you want to update 
    # + experimentId - The ID of the Multivariate Test the requested Section is part of 
    # + payload - A string in JSON format that includes all the fields to create a Section 
    # + return - Successfully updated Section 
    remote isolated function updateSection(int sectionId, int experimentId, SectionUpdate payload) returns Section|error {
        string  path = string `/experiments/${experimentId}/sections/${sectionId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Section response = check self.clientEp->patch(path, request, targetType=Section);
        return response;
    }
    # Get Experiment results time series
    #
    # + experimentId - The ID for the Experiment you want results for 
    # + baselineVariationId - The ID of the variation to use as the baseline to compare against other variations. Defaults to the first variation if not provided. For an experience in a personalization campaign, the value can also be the string 'holdback'. 
    # + startTime - The start time of the time interval (beginning time included) used to calculate the results over. If unspecified, defaults to the time that the Experiment was first activated. The start time will be rounded the smallest time modulo 5 minutes larger or equal to start_time. 
    # + endTime - The end of the time interval (end time excluded) used to calculate results over. If unspecified, defaults to the current time if the Experiment is still running, otherwise defaults to the time the experiment was last active. The end time will be rounded to the largest time modulo 5 minutes smaller or equal to end_time. The end_time in the response may be earlier than requested if fresher results are not available yet. In this case, the results will continue to calculate in the background and subsequent requests will eventually return the full results. 
    # + browser - Browser to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [device, source, attribute_id, attribute_value]. 
    # + device - Device to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, source, attribute_id, attribute_value]. 
    # + 'source - Source to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, device, attribute_id, attribute_value]. Campaign: Contains users that arrive on a URL containing a 'utm_campaign,' 'utm_source,' 'gclid,' or 'otm_source' query parameter. If the URL contains one of these parameters, the visitor will count as "Campaign" traffic even if they arrived through search. Direct:  Includes all users who do not have any external referrer in their URL. Referral: Includes all users that come from another URL that doesn't count as Campaign. 
    # + attributeId - ID of the attribute to segment results by. Requests containing attribute_id will return the results for all visitors that have attribute_value for the attribute represented by attribute_id. If present, the attribute_value parameter must also be present, and it cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + attributeValue - UTF-8 encoded value correlating to attribute_id. If present, the attribute_id parameter must also be present. This parameter also requires attribute_id to be set, and cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + segmentConditions - (BETA) A string representation of a JSON Segment Conditions Expression. This parameter can be either URL-escaped stringified JSON or Base64-encoded stringified JSON using URL-safe alphabet (preferred). Segment Conditions Expressions consist of Logical Expressions and Match Expressions. Logical Expressions are represented as an array of the format [<operator>, <expression>...], where the supported operators are "and", "or" and "not". Match Expressions are represented as an object of the format {"attribute_id": <attribute_id>, "attribute_value": <value>[, "match_type": <match_type>]}, where supported values for match_type are "exact" match type will match only an exact string match between "value" string and the attribute value. "substring" match type will match if "value" is a substring of the attribute value. "prefix" match type will match if "value" is a string prefix of the attribute value. "regex" match type will match if "value" is a regular expression match for the attribute value. The default match_type is "exact". 
    # + return - Return Experiment results time series 
    remote isolated function getExperimentTimeseries(int experimentId, string? baselineVariationId = (), string? startTime = (), string? endTime = (), string? browser = (), string? device = (), string? 'source = (), int? attributeId = (), string? attributeValue = (), string? segmentConditions = ()) returns ExperimentTimeseries|error {
        string  path = string `/experiments/${experimentId}/timeseries`;
        map<anydata> queryParam = {"baseline_variation_id": baselineVariationId, "start_time": startTime, "end_time": endTime, "browser": browser, "device": device, "source": 'source, "attribute_id": attributeId, "attribute_value": attributeValue, "segment_conditions": segmentConditions};
        path = path + check getPathForQueryParam(queryParam);
        ExperimentTimeseries response = check self.clientEp-> get(path, targetType = ExperimentTimeseries);
        return response;
    }
    # Get Campaign results as a CSV
    #
    # + campaignId - The ID for the Campaign you want results for 
    # + startTime - The start time of the time interval (beginning time included) used to calculate the results over. If unspecified, defaults to the time that the Campaign was first activated. The start time will be rounded the smallest time modulo 5 minutes larger or equal to start_time. 
    # + endTime - The end of the time interval (end time excluded) used to calculate results over. If unspecified, defaults to the current time if the Experiment is still running, otherwise defaults to the time the experiment was last active. The end time will be rounded to the largest time modulo 5 minutes smaller or equal to end_time. The end_time in the response may be earlier than requested if fresher results are not available yet. In this case, the results will continue to calculate in the background and subsequent requests will eventually return the full results. 
    # + browser - Browser to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [device, source, attribute_id, attribute_value]. 
    # + device - Device to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, source, attribute_id, attribute_value]. 
    # + 'source - Source to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, device, attribute_id, attribute_value]. Campaign: Contains users that arrive on a URL containing a 'utm_campaign,' 'utm_source,' 'gclid,' or 'otm_source' query parameter. If the URL contains one of these parameters, the visitor will count as "Campaign" traffic even if they arrived through search. Direct:  Includes all users who do not have any external referrer in their URL. Referral: Includes all users that come from another URL that doesn't count as Campaign. 
    # + attributeId - ID of the attribute to segment results by. Requests containing attribute_id will return the results for all visitors that have attribute_value for the attribute represented by attribute_id. If present, the attribute_value parameter must also be present, and it cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + attributeValue - UTF-8 encoded value correlating to attribute_id. If present, the attribute_id parameter must also be present. This parameter also requires attribute_id to be set, and cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + segmentConditions - (BETA) A string representation of a JSON Segment Conditions Expression. This parameter can be either URL-escaped stringified JSON or Base64-encoded stringified JSON using URL-safe alphabet (preferred). Segment Conditions Expressions consist of Logical Expressions and Match Expressions. Logical Expressions are represented as an array of the format [<operator>, <expression>...], where the supported operators are "and", "or" and "not". Match Expressions are represented as an object of the format {"attribute_id": <attribute_id>, "attribute_value": <value>[, "match_type": <match_type>]}, where supported values for match_type are "exact" match type will match only an exact string match between "value" string and the attribute value. "substring" match type will match if "value" is a substring of the attribute value. "prefix" match type will match if "value" is a string prefix of the attribute value. "regex" match type will match if "value" is a regular expression match for the attribute value. The default match_type is "exact". 
    # + return - <p>Return Campaign results in CSV format</p> <p>Name of the columns returned: 'Start Time (UTC)', 'End Time (UTC)', 'Is Baseline Variation', 'Metric Event Name', 'Metric Event ID', 'Metric Numerator Type', 'Metric Denominator Type', 'Metric Winning Direction', 'Numerator Value', 'Denominator Value', 'Metric Value', 'Improvement Status from Baseline', 'Improvement Value from Baseline', 'Statistical Significance', 'Is Improvement Significant', 'Confidence Interval - Low', 'Confidence Interval - High', 'Samples Remaining to Significance'</p> <p>(<a href="https://help.optimizely.com/Export_to_CSV_column_reference_for_campaigns_and_experiments">Column reference guide for CSV export</a>)</p> 
    remote isolated function getCampaignResultsCsv(int campaignId, string? startTime = (), string? endTime = (), string? browser = (), string? device = (), string? 'source = (), int? attributeId = (), string? attributeValue = (), string? segmentConditions = ()) returns http:Response|error {
        string  path = string `/export/campaigns/${campaignId}/results/csv`;
        map<anydata> queryParam = {"start_time": startTime, "end_time": endTime, "browser": browser, "device": device, "source": 'source, "attribute_id": attributeId, "attribute_value": attributeValue, "segment_conditions": segmentConditions};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get aws credentials to access enriched events dataset
    #
    # + duration - Duration of the aws credentials token. Please use [H,h] for hours or [M,m] for minutes. Minimum is 15m and Maximum is 1h. Usage 1h. 
    # + return - Return aws credentials 
    remote isolated function getEnrichedEventsExportCredentials(string duration = "1h") returns E3Credentials|error {
        string  path = string `/export/credentials`;
        map<anydata> queryParam = {"duration": duration};
        path = path + check getPathForQueryParam(queryParam);
        E3Credentials response = check self.clientEp-> get(path, targetType = E3Credentials);
        return response;
    }
    # Get Experiment results as a CSV
    #
    # + experimentId - The ID for the Experiment you want results for 
    # + baselineVariationId - The ID of the variation to use as the baseline to compare against other variations. Defaults to the first variation if not provided. For an experience in a personalization campaign, the value can also be the string 'holdback'. 
    # + startTime - The start time of the time interval (beginning time included) used to calculate the results over. If unspecified, defaults to the time that the Experiment was first activated. The start time will be rounded the smallest time modulo 5 minutes larger or equal to start_time. 
    # + endTime - The end of the time interval (end time excluded) used to calculate results over. If unspecified, defaults to the current time if the Experiment is still running, otherwise defaults to the time the experiment was last active. The end time will be rounded to the largest time modulo 5 minutes smaller or equal to end_time. The end_time in the response may be earlier than requested if fresher results are not available yet. In this case, the results will continue to calculate in the background and subsequent requests will eventually return the full results. 
    # + browser - Browser to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [device, source, attribute_id, attribute_value]. 
    # + device - Device to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, source, attribute_id, attribute_value]. 
    # + 'source - Source to segment results by. This parameter must not be sent with any other segmentation parameters, i.e. any parameters in [browser, device, attribute_id, attribute_value]. Campaign: Contains users that arrive on a URL containing a 'utm_campaign,' 'utm_source,' 'gclid,' or 'otm_source' query parameter. If the URL contains one of these parameters, the visitor will count as "Campaign" traffic even if they arrived through search. Direct:  Includes all users who do not have any external referrer in their URL. Referral: Includes all users that come from another URL that doesn't count as Campaign. 
    # + attributeId - ID of the attribute to segment results by. Requests containing attribute_id will return the results for all visitors that have attribute_value for the attribute represented by attribute_id. If present, the attribute_value parameter must also be present, and it cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + attributeValue - UTF-8 encoded value correlating to attribute_id. If present, the attribute_id parameter must also be present. This parameter also requires attribute_id to be set, and cannot be sent with any other segmentation parameters, i.e. any parameters in [browser, device, source]. 
    # + segmentConditions - (BETA) A string representation of a JSON Segment Conditions Expression. This parameter can be either URL-escaped stringified JSON or Base64-encoded stringified JSON using URL-safe alphabet (preferred). Segment Conditions Expressions consist of Logical Expressions and Match Expressions. Logical Expressions are represented as an array of the format [<operator>, <expression>...], where the supported operators are "and", "or" and "not". Match Expressions are represented as an object of the format {"attribute_id": <attribute_id>, "attribute_value": <value>[, "match_type": <match_type>]}, where supported values for match_type are "exact" match type will match only an exact string match between "value" string and the attribute value. "substring" match type will match if "value" is a substring of the attribute value. "prefix" match type will match if "value" is a string prefix of the attribute value. "regex" match type will match if "value" is a regular expression match for the attribute value. The default match_type is "exact". 
    # + return - <p>Return Experiment results in CSV format</p> <p>Name of the columns returned: 'Start time (UTC)', 'End time (UTC)', 'Variation Name', 'Variation ID', 'Is Baseline Variation', 'Metric Event Name', 'Metric Event ID', 'Metric Numerator Type', 'Metric Denominator Type', 'Metric Winning Direction', 'Numerator Value', 'Denominator Value', 'Metric Value', 'Improvement Status from Baseline', 'Improvement Value from Baseline', 'Statistical Significance', 'Is Improvement Significant', 'Confidence Interval - Low', 'Confidence Interval - High', 'Samples Remaining to Significance'</p> <p>(<a href="https://help.optimizely.com/Export_to_CSV_column_reference_for_campaigns_and_experiments">Column reference guide for CSV export</a>)</p> 
    remote isolated function getExperimentResultsCsv(int experimentId, string? baselineVariationId = (), string? startTime = (), string? endTime = (), string? browser = (), string? device = (), string? 'source = (), int? attributeId = (), string? attributeValue = (), string? segmentConditions = ()) returns http:Response|error {
        string  path = string `/export/experiments/${experimentId}/results/csv`;
        map<anydata> queryParam = {"baseline_variation_id": baselineVariationId, "start_time": startTime, "end_time": endTime, "browser": browser, "device": device, "source": 'source, "attribute_id": attributeId, "attribute_value": attributeValue, "segment_conditions": segmentConditions};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # List Extensions
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The ID of the project you would like to list all extensions for 
    # + return - Return all extensions in the specified project 
    remote isolated function listExtensions(int projectId, int perPage = 25, int page = 1) returns Extension[]|error {
        string  path = string `/extensions`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Extension[] response = check self.clientEp-> get(path, targetType = ExtensionArr);
        return response;
    }
    # Create an Extension
    #
    # + payload - A string in JSON format that includes all the fields to create an extension 
    # + return - Return the created extension 
    remote isolated function createExtension(Extension payload) returns Extension|error {
        string  path = string `/extensions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Extension response = check self.clientEp->post(path, request, targetType=Extension);
        return response;
    }
    # Get an Extension
    #
    # + extensionId - The ID of the extension you'd like to get 
    # + return - Return extension info 
    remote isolated function getExtension(int extensionId) returns Extension|error {
        string  path = string `/extensions/${extensionId}`;
        Extension response = check self.clientEp-> get(path, targetType = Extension);
        return response;
    }
    # Archive an Extension
    #
    # + extensionId - The ID of the extension you'd like to archive 
    # + return - Successfully archived extension 
    remote isolated function deleteExtension(int extensionId) returns http:Response|error {
        string  path = string `/extensions/${extensionId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update an Extension
    #
    # + extensionId - The extension ID of the extension you want to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an extension 
    # + return - Return the updated extension 
    remote isolated function updateExtension(int extensionId, ExtensionUpdate payload) returns Extension|error {
        string  path = string `/extensions/${extensionId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Extension response = check self.clientEp->patch(path, request, targetType=Extension);
        return response;
    }
    # Get Features by Project
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The ID of the project for which you would like to get Features 
    # + return - Return all Features in a specified Project 
    remote isolated function listFeatures(int projectId, int perPage = 25, int page = 1) returns Feature[]|error {
        string  path = string `/features`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Feature[] response = check self.clientEp-> get(path, targetType = FeatureArr);
        return response;
    }
    # Create a Feature
    #
    # + payload - A string in JSON format that includes all the fields to create a new Feature. Note this endpoint is incompatible with Full Stack Targeted Rollouts projects  
    # + return - Successfully created the Feature 
    remote isolated function createFeature(Feature payload) returns Feature|error {
        string  path = string `/features`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Feature response = check self.clientEp->post(path, request, targetType=Feature);
        return response;
    }
    # Read a Feature
    #
    # + featureId - The unique identifier for the Feature 
    # + return - Successfully retrieved the Feature 
    remote isolated function getFeature(int featureId) returns Feature|error {
        string  path = string `/features/${featureId}`;
        Feature response = check self.clientEp-> get(path, targetType = Feature);
        return response;
    }
    # Archive a Feature
    #
    # + featureId - The ID of the Feature you'd like to archive 
    # + return - Successfully archived the Feature 
    remote isolated function deleteFeature(int featureId) returns http:Response|error {
        string  path = string `/features/${featureId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update a Feature
    #
    # + featureId - The unique identifier for the Feature 
    # + payload - A string in JSON format that includes all the fields you'd like to change for a Feature 
    # + return - Successfully updated the Feature 
    remote isolated function updateFeature(int featureId, FeatureUpdate payload) returns Feature|error {
        string  path = string `/features/${featureId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Feature response = check self.clientEp->patch(path, request, targetType=Feature);
        return response;
    }
    # List Exclusion Groups
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The ID of the Project you would like to list all Exclusion Groups for 
    # + return - Return all Exclusion Groups in the specified Project 
    remote isolated function listGroups(int projectId, int perPage = 25, int page = 1) returns Group[]|error {
        string  path = string `/groups`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Create an Exclusion Group
    #
    # + payload - A string in JSON format that includes all the fields to create an Exclusion Group 
    # + return - Return the created Exclusion Group 
    remote isolated function createGroup(Group payload) returns Group|error {
        string  path = string `/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->post(path, request, targetType=Group);
        return response;
    }
    # Get an Exclusion Group
    #
    # + groupId - The ID of the Exclusion Group you'd like to get 
    # + return - Return Exclusion Group info 
    remote isolated function getGroup(int groupId) returns Group|error {
        string  path = string `/groups/${groupId}`;
        Group response = check self.clientEp-> get(path, targetType = Group);
        return response;
    }
    # Archive an Exclusion Group
    #
    # + groupId - The ID of the Exclusion Group you'd like to archive 
    # + return - Successfully archived Exclusion Group 
    remote isolated function deleteGroup(int groupId) returns http:Response|error {
        string  path = string `/groups/${groupId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update an Exclusion Group
    #
    # + groupId - The group ID of the Exclusion Group you want to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an Exclusion Group 
    # + return - Return the updated Exclusion Group 
    remote isolated function updateGroup(int groupId, GroupUpdate payload) returns Group|error {
        string  path = string `/groups/${groupId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->patch(path, request, targetType=Group);
        return response;
    }
    # Get list attributes by project
    #
    # + projectId - The ID of the project for which you would like to get List Attributes 
    # + return - Return all List Attributes in the specified Project 
    remote isolated function listListAttributes(int projectId) returns ListAttribute[]|error {
        string  path = string `/list_attributes`;
        map<anydata> queryParam = {"project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        ListAttribute[] response = check self.clientEp-> get(path, targetType = ListAttributeArr);
        return response;
    }
    # Create a List Attribute
    #
    # + payload - A string in JSON format that includes all the fields to create a new List Attribute 
    # + return - Successfully created the List Attribute 
    remote isolated function createListAttribute(ListAttribute payload) returns ListAttribute|error {
        string  path = string `/list_attributes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListAttribute response = check self.clientEp->post(path, request, targetType=ListAttribute);
        return response;
    }
    # Read a List Attribute
    #
    # + listAttributeId - the unique identifier for the List Attribute 
    # + return - Successfully retrieved List Attribute 
    remote isolated function getListAttribute(int listAttributeId) returns ListAttribute|error {
        string  path = string `/list_attributes/${listAttributeId}`;
        ListAttribute response = check self.clientEp-> get(path, targetType = ListAttribute);
        return response;
    }
    # Archive a List Attribute
    #
    # + listAttributeId - The ID of the List Attribute you'd like to archive 
    # + return - Successfully archived List Attribute 
    remote isolated function archiveListAttribute(int listAttributeId) returns http:Response|error {
        string  path = string `/list_attributes/${listAttributeId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update a List Attribute
    #
    # + listAttributeId - The ID of the List Attribute you'd like to update 
    # + payload - A string in JSON format that includes all the fields you'd like to change for a List Attribute 
    # + return - Successfully updated the List Attribute 
    remote isolated function updateListAttribute(int listAttributeId, ListAttributeUpdate payload) returns ListAttribute|error {
        string  path = string `/list_attributes/${listAttributeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListAttribute response = check self.clientEp->patch(path, request, targetType=ListAttribute);
        return response;
    }
    # List Pages
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + projectId - The Project ID of the Project you would like to list all Pages for 
    # + return - Return Project Pages info 
    remote isolated function listPages(int projectId, int perPage = 25, int page = 1) returns Page[]|error {
        string  path = string `/pages`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        Page[] response = check self.clientEp-> get(path, targetType = PageArr);
        return response;
    }
    # Create a Page
    #
    # + payload - A string in JSON format that includes all the fields to create a Page 
    # + return - Return the created Page 
    remote isolated function createPage(Page payload) returns Page|error {
        string  path = string `/pages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Page response = check self.clientEp->post(path, request, targetType=Page);
        return response;
    }
    # Read a page
    #
    # + pageId - The Page ID of the Page you want to get 
    # + return - Return Page info 
    remote isolated function getPage(int pageId) returns Page|error {
        string  path = string `/pages/${pageId}`;
        Page response = check self.clientEp-> get(path, targetType = Page);
        return response;
    }
    # Delete a Page
    #
    # + pageId - The Page ID of the Page you want to delete 
    # + return - Successfully deleted the Page 
    remote isolated function deletePage(int pageId) returns http:Response|error {
        string  path = string `/pages/${pageId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update a Page
    #
    # + pageId - The Page ID of the Page you want to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for a Page 
    # + return - Return the updated Page 
    remote isolated function updatePage(int pageId, PageUpdate payload) returns Page|error {
        string  path = string `/pages/${pageId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Page response = check self.clientEp->patch(path, request, targetType=Page);
        return response;
    }
    # Create an In-Page Event
    #
    # + pageId - The Page ID of the Page you want to create an In-Page Event for 
    # + payload - A string in JSON format that includes all the fields to create an In-Page Event 
    # + return - Return the created In-Page event 
    remote isolated function createInPageEvent(int pageId, InPageEvent payload) returns InPageEvent|error {
        string  path = string `/pages/${pageId}/events`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InPageEvent response = check self.clientEp->post(path, request, targetType=InPageEvent);
        return response;
    }
    # Delete an In-Page Event
    #
    # + pageId - The Page ID of the In-Page Event you want to delete 
    # + eventId - The In-Page Event ID of the In-Page Event you want to delete 
    # + return - Successfully deleted In-Page event 
    remote isolated function deleteInPageEvent(int pageId, int eventId) returns http:Response|error {
        string  path = string `/pages/${pageId}/events/${eventId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update an In-Page Event
    #
    # + pageId - The Page ID of the In-Page Event you want to change 
    # + eventId - The In-Page Event ID of the In-Page Event you want to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for an In-Page Event 
    # + return - Successfully updated the In-Page event 
    remote isolated function updateInPageEvent(int pageId, int eventId, InPageEventUpdate payload) returns InPageEvent|error {
        string  path = string `/pages/${pageId}/events/${eventId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InPageEvent response = check self.clientEp->patch(path, request, targetType=InPageEvent);
        return response;
    }
    # Get Plan & Usage information for all products
    #
    # + return - Return Plan & Usage information 
    remote isolated function getPlan() returns Plan|error {
        string  path = string `/plan`;
        Plan response = check self.clientEp-> get(path, targetType = Plan);
        return response;
    }
    # List Projects
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + return - Return all Projects 
    remote isolated function listProjects(int perPage = 25, int page = 1) returns Project[]|error {
        string  path = string `/projects`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        Project[] response = check self.clientEp-> get(path, targetType = ProjectArr);
        return response;
    }
    # Create a Project
    #
    # + payload - A string in JSON format that includes all the fields to create a Project 
    # + return - Return the created Project 
    remote isolated function createProject(Project payload) returns Project|error {
        string  path = string `/projects`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, targetType=Project);
        return response;
    }
    # Read a Project
    #
    # + projectId - The Project ID of the Project you want to get 
    # + return - Return Project info 
    remote isolated function getProject(int projectId) returns Project|error {
        string  path = string `/projects/${projectId}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Update a Project
    #
    # + projectId - The Project ID of the Project you want to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for a Project 
    # + return - Return the updated Project 
    remote isolated function updateProject(int projectId, ProjectUpdate payload) returns Project|error {
        string  path = string `/projects/${projectId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->patch(path, request, targetType=Project);
        return response;
    }
    # Create a Custom Event
    #
    # + projectId - The Project ID of the Project you want to create an Custom Event in 
    # + payload - A string in JSON format that includes all the fields to create a Custom Event 
    # + return - Return the created Custom Event 
    remote isolated function createCustomEvent(int projectId, CustomEvent payload) returns CustomEvent|error {
        string  path = string `/projects/${projectId}/custom_events`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomEvent response = check self.clientEp->post(path, request, targetType=CustomEvent);
        return response;
    }
    # Delete a Custom Event
    #
    # + projectId - The project ID of the Project the Custom Event is stored in 
    # + eventId - The Event ID of the Custom Event you'd like to delete 
    # + return - Successfully deleted Custom Event 
    remote isolated function deleteCustomEvent(int projectId, int eventId) returns http:Response|error {
        string  path = string `/projects/${projectId}/custom_events/${eventId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Update a Custom Event
    #
    # + projectId - The project ID of the Project the Custom Event is stored in 
    # + eventId - The Event ID of the Custom Event you'd like to change 
    # + payload - A string in JSON format that includes all the fields you'd like to change for a Custom Event 
    # + return - Return the updated Event 
    remote isolated function updateCustomEvent(int projectId, int eventId, CustomEventUpdate payload) returns CustomEvent|error {
        string  path = string `/projects/${projectId}/custom_events/${eventId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomEvent response = check self.clientEp->patch(path, request, targetType=CustomEvent);
        return response;
    }
    # Download a CSV with all current catalog data
    #
    # + date - A string in JSON format that includes all the fields to create a Custom Event 
    # + catalogId - The Catalog ID of the Catalog you want to download 
    # + return - Return the CSV with correct headers to force download 
    remote isolated function getRecsCatalogCsv(string date, string catalogId) returns http:Response|error {
        string  path = string `/recommendations/catalogs/${catalogId}/catalog/${date}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Download a CSV with all computed recommendations output data
    #
    # + date - A string in JSON format that includes all the fields to create a Custom Event 
    # + catalogId - The Catalog ID of the Catalog which contains the Recommender 
    # + recommenderId - The Recommender ID of the Recommender you want to get output from 
    # + return - Return the CSV with correct headers to force download 
    remote isolated function getRecsOutputCsv(string date, string catalogId, string recommenderId) returns http:Response|error {
        string  path = string `/recommendations/catalogs/${catalogId}/recommenders/${recommenderId}/${date}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Download a CSV with summary stats data
    #
    # + date - A string in JSON format that includes all the fields to create a Custom Event 
    # + catalogId - The Catalog ID of the Catalog you want to download stats for 
    # + return - Return the CSV with correct headers to force download 
    remote isolated function getRecsStatsCsv(string date, string catalogId) returns http:Response|error {
        string  path = string `/recommendations/catalogs/${catalogId}/stats/${date}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # List Subject Access Requests
    #
    # + perPage - Optional pagination argument that specifies the maximum number of objects to return per request 
    # + page - Optional pagination argument that specifies the page to return. If you have 140 objects and you choose to return 100 objects per page you will be able to access the last 40 objects on page 2. The default value is 1. 
    # + return - Return Subject Access Request info 
    remote isolated function listSarRequestsByAccount(int perPage = 25, int page = 1) returns SubjectAccessRequest[]|error {
        string  path = string `/subject-access-requests`;
        map<anydata> queryParam = {"per_page": perPage, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        SubjectAccessRequest[] response = check self.clientEp-> get(path, targetType = SubjectAccessRequestArr);
        return response;
    }
    # Create a Subject Access Request
    #
    # + payload - A JSON string containing the fields needed to create a subject access request. 
    # + return - Return the created SubjectAccessRequest 
    remote isolated function createSarRequest(SubjectAccessRequest payload) returns SubjectAccessRequest|error {
        string  path = string `/subject-access-requests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubjectAccessRequest response = check self.clientEp->post(path, request, targetType=SubjectAccessRequest);
        return response;
    }
    # Get Subject Access Request
    #
    # + requestId - The ID of the Subject Access Request 
    # + return - Return Subject Access Request info 
    remote isolated function getSarRequest(int requestId) returns SubjectAccessRequest|error {
        string  path = string `/subject-access-requests/${requestId}`;
        SubjectAccessRequest response = check self.clientEp-> get(path, targetType = SubjectAccessRequest);
        return response;
    }
}
