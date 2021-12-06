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

# This is a generated connector for [ProdPad API v1.0](https://www.prodpad.com/) OpenAPI specification. 
# ProdPad is product management software that helps product managers develop product strategy. Easily manage teams, customers and roadmaps.  
@display {label: "ProdPad", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [ProdPad account](https://www.prodpad.com/) and obtain tokens by following [this guide](https://help.prodpad.com/article/763-generating-an-api-key).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.prodpad.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get list of feedbacks
    #
    # + groupBy - Setting to customer will group the feedback by customer 
    # + state - Set to value of active for active, archived for archived feedback, unsorted for unsorted feedback and all for all feedback. Default is active. 
    # + page - Set to page through the results. Default is 1. 
    # + size - For setting the number of results per page. Default is 100. 
    # + company - Set to filter the feedback results based on whether the feedback was entered for a contact linked to the company. 
    # + companyCountry - Set to filter the feedback results based on the country set for the associated company. 
    # + companySize - Set to filter the feedback results based on the size of the company for the associated company. 
    # + companyValue - Set to filter the feedback results based on the value of the company for the company assocaited to the feedback. 
    # + customer - Can be either numeric ID, UUID of a contac or contact email. 
    # + product - Filter results by the product associated to feedback. Can either be the product UUID or product ID. 
    # + persona - Filter results by the persona associated to feedback. Can either be the persona UUID or persona ID. 
    # + jobRole - Filter results by the job role of the contact associated to the feedback. Use the JobRole UUID. 
    # + tags - Filter feedback results by the tags associated to the feedback. Mulitple tags can be specified and acts as an OR. Use the tag ID or UUID. 
    # + hasIdeas - Whether the feedback is associated to one or more ideas. Default is either. 
    # + externalId - Filter feedback to return the feedback associated with a specific External ID. An example of an external ID is the ID of a record in a CRM or ID of a ticket in a customer support application. 
    # + externalUrl - Filter feedback to return the feedback associated with a specific external url. An example of an external url is that of a record in a CRM or a ticket in a customer support application 
    # + return - Success response. 
    remote isolated function getFeedbacks(string? groupBy = (), string? state = (), int? page = (), int? size = (), string? company = (), string? companyCountry = (), string? companySize = (), string? companyValue = (), string? customer = (), string? product = (), string? persona = (), string? jobRole = (), string[]? tags = (), boolean? hasIdeas = (), string? externalId = (), string? externalUrl = ()) returns FeedbackList|error {
        string  path = string `/feedbacks`;
        map<anydata> queryParam = {"group_by": groupBy, "state": state, "page": page, "size": size, "company": company, "company_country": companyCountry, "company_size": companySize, "company_value": companyValue, "customer": customer, "product": product, "persona": persona, "job_role": jobRole, "tags": tags, "has_ideas": hasIdeas, "external_id": externalId, "external_url": externalUrl};
        map<Encoding> queryParamEncoding = {"tags": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        FeedbackList response = check self.clientEp-> get(path, targetType = FeedbackList);
        return response;
    }
    # Create a new feedback.
    #
    # + payload - Post body for the feedback. 
    # + return - Success response. 
    remote isolated function postFeedbacks(FeedbackPost payload) returns ContactLinkWithFeedback|error {
        string  path = string `/feedbacks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactLinkWithFeedback response = check self.clientEp->post(path, request, targetType=ContactLinkWithFeedback);
        return response;
    }
    # Get a piece of feedback.
    #
    # + id - Feedback ID. 
    # + return - Success response. 
    remote isolated function getFeedback(int id) returns ContactLinkWithFeedback|error {
        string  path = string `/feedbacks/${id}`;
        ContactLinkWithFeedback response = check self.clientEp-> get(path, targetType = ContactLinkWithFeedback);
        return response;
    }
    # Edit an existing piece of feedback.
    #
    # + id - Feedback ID 
    # + payload - Edits of the feedback. 
    # + return - Success response. 
    remote isolated function putFeedback(int id, FeedbackPut payload) returns http:Response|error {
        string  path = string `/feedbacks/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get all ideas associated with a feedback
    #
    # + id - Feedback ID 
    # + return - Success response 
    remote isolated function getFeedbackIdeas(int id) returns Idea[]|error {
        string  path = string `/feedbacks/${id}/ideas`;
        Idea[] response = check self.clientEp-> get(path, targetType = IdeaArr);
        return response;
    }
    # Get a list of contacts
    #
    # + company - UUID of a company to filter contacts by. 
    # + persona - ID of a persona to filter contacts by. 
    # + jobRole - UUID of a job role to filter contacts by. 
    # + tags - ID, UUID or name of one or more tags to filter the contacts by. 
    # + name - Name of contact or partial name of contacts to filter the list by 
    # + externalId - Filter the contacts by an ID from another application such as a CRM 
    # + externalUrl - Filter the contacts by a URL from another application such as a CRM 
    # + email - Filter the contacts by an email. 
    # + feedbacks - Wheter to include the feedback for each contact in the results. Default is false. 
    # + page - Page number of results to return. 
    # + size - Number of results per page. 
    # + return - Success response. 
    remote isolated function getContacts(string? company = (), string? persona = (), string? jobRole = (), string[]? tags = (), string? name = (), string? externalId = (), string? externalUrl = (), string? email = (), boolean feedbacks = false, int? page = (), int? size = ()) returns ContactList|error {
        string  path = string `/contacts`;
        map<anydata> queryParam = {"company": company, "persona": persona, "job_role": jobRole, "tags": tags, "name": name, "external_id": externalId, "external_url": externalUrl, "email": email, "feedbacks": feedbacks, "page": page, "size": size};
        map<Encoding> queryParamEncoding = {"tags": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        ContactList response = check self.clientEp-> get(path, targetType = ContactList);
        return response;
    }
    # Create a new contact
    #
    # + payload - New contact details 
    # + return - Success response 
    remote isolated function postContacts(ContactPost payload) returns Contact|error {
        string  path = string `/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contact response = check self.clientEp->post(path, request, targetType=Contact);
        return response;
    }
    # Get a contact
    #
    # + id - Contact ID to fetch. 
    # + feedbacks - Whether to include the feedback provided by the contact in the response or not. 
    # + return - Success response. 
    remote isolated function getContact(string id, boolean feedbacks = true) returns InlineResponse200|error {
        string  path = string `/contacts/${id}`;
        map<anydata> queryParam = {"feedbacks": feedbacks};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Edit a contact.
    #
    # + id - Contact ID to edit. 
    # + payload - Edits to the contact. 
    # + return - Success response. 
    remote isolated function putContact(string id, ContactPost payload) returns Contact|error {
        string  path = string `/contacts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contact response = check self.clientEp->put(path, request, targetType=Contact);
        return response;
    }
    # Get a list of companies.
    #
    # + country - Set to filter the companies based on the country. Use ISO Alpha-2 country codes. Only one country can be filtered at a time. 
    # + size - Set to filter the companies based on their size. 
    # + value - Set to filter the companies based on their value. 
    # + city - Set to filter the companies based on city. 
    # + tags - Filter companies by the tags associated to the feedback. Mulitple tags can be specified and acts as an OR. Use the tag ID or UUID. 
    # + name - Filter the companies by the name or partial name of the companies. 
    # + externalId - Filter the companies by an ID from a 3rd party application associated to the companies in Prodpad 
    # + externalUrl - Filter the companies by a URL that is associated to a company. 
    # + contacts - Whether to include contacts associated with each company in the results. Default is true. 
    # + feedbacks - Whether to include the feedback for each contact associated to a company in the results. Default is true. Note if this is set to true then contacts will be returned whether or not contacts is set to true or false. 
    # + page - The page of results to return (size is always 100). 
    # + return - Success response. 
    remote isolated function getCompanies(string? country = (), string? size = (), string? value = (), string? city = (), string[]? tags = (), string? name = (), string? externalId = (), string? externalUrl = (), boolean contacts = true, boolean feedbacks = true, int? page = ()) returns CompanyList|error {
        string  path = string `/companies`;
        map<anydata> queryParam = {"country": country, "size": size, "value": value, "city": city, "tags": tags, "name": name, "external_id": externalId, "external_url": externalUrl, "contacts": contacts, "feedbacks": feedbacks, "page": page};
        map<Encoding> queryParamEncoding = {"tags": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        CompanyList response = check self.clientEp-> get(path, targetType = CompanyList);
        return response;
    }
    # Create a new company
    #
    # + payload - Post body request with the company details used to create a new company. 
    # + return - Success response. 
    remote isolated function postCompanies(CompanyPost payload) returns Company|error {
        string  path = string `/companies`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Company response = check self.clientEp->post(path, request, targetType=Company);
        return response;
    }
    # Get a company
    #
    # + id - UUID of the company to fetch. 
    # + return - Success response. 
    remote isolated function getCompany(string id) returns Company|error {
        string  path = string `/companies/${id}`;
        Company response = check self.clientEp-> get(path, targetType = Company);
        return response;
    }
    # Edit a company.
    #
    # + id - UUID of the company to edit. 
    # + payload - Changes to be made to a company. 
    # + return - Success response. 
    remote isolated function putCompany(string id, CompanyPost payload) returns Company|error {
        string  path = string `/companies/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Company response = check self.clientEp->put(path, request, targetType=Company);
        return response;
    }
    # Get the job roles for the account.
    #
    # + return - Success response. 
    remote isolated function getJobRoles() returns JobRoleList|error {
        string  path = string `/jobroles`;
        JobRoleList response = check self.clientEp-> get(path, targetType = JobRoleList);
        return response;
    }
    # Get a list of ideas.
    #
    # + tags - One or more tag names to filter the ideas by. These act as an OR not AND. 
    # + product - Name of a product to filter the ideas by. 
    # + persona - Name of a persona to filter the ideas by. 
    # + status - Name of a workflow status to filter the ideas by. 
    # + state - Filters the returned ideas based on their state. Active Public is same as portal in the UI. If not included then the endpoint returns all active and active_public the same as the UI. 
    # + externalId - Return ideas or idea with a specific external_id. 
    # + externalUrl - Return ideas or idea with a specific URL to an external resource 
    # + withfeedback - Return the associated feedback to the ideas 
    # + page - Page of results to return 
    # + size - The number of results per page 
    # + return - Success response. 
    remote isolated function getIdeas(string[]? tags = (), string? product = (), string? persona = (), string? status = (), string? state = (), string? externalId = (), string? externalUrl = (), boolean? withfeedback = (), int page = 1, int size = 20) returns IdeaList|error {
        string  path = string `/ideas`;
        map<anydata> queryParam = {"tags": tags, "product": product, "persona": persona, "status": status, "state": state, "external_id": externalId, "external_url": externalUrl, "withfeedback": withfeedback, "page": page, "size": size};
        map<Encoding> queryParamEncoding = {"tags": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        IdeaList response = check self.clientEp-> get(path, targetType = IdeaList);
        return response;
    }
    # Create a new idea.
    #
    # + payload - Idea to add to the account 
    # + return - Success response. 
    remote isolated function postIdeas(IdeaPost payload) returns Idea|error {
        string  path = string `/ideas`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Idea response = check self.clientEp->post(path, request, targetType=Idea);
        return response;
    }
    # Get an idea.
    #
    # + id - Numeric ID of the idea unless using the by_project_id then it is the numeric project ID (the Idea number seen in the UI). 
    # + expand - Whether to return the expanded version of the idea ojbect. This adds in business case, user stories, comments, etc. 
    # + byProjectId - Whether the ID represents the project_id instead of the numeric ID. 
    # + return - Success response. 
    remote isolated function getIdeaByID(int id, boolean expand = false, boolean byProjectId = false) returns InlineResponse2001|error {
        string  path = string `/ideas/${id}`;
        map<anydata> queryParam = {"expand": expand, "by_project_id": byProjectId};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Edit an existing idea.
    #
    # + id - Numeric ID of the idea (not the project id). 
    # + payload - Edits to an idea 
    # + return - Success response. 
    remote isolated function putIdea(int id, IdeaPut payload) returns http:Response|error {
        string  path = string `/ideas/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get thoughts on an idea
    #
    # + id - Numeric ID of the idea. 
    # + return - Success response. 
    remote isolated function getIdeaVotes(int id) returns IdeaThoughts|error {
        string  path = string `/ideas/${id}/votes`;
        IdeaThoughts response = check self.clientEp-> get(path, targetType = IdeaThoughts);
        return response;
    }
    # Add a new thought to ideas. This is an alias for POST /votes.
    #
    # + id - Numeric ID of the idea. 
    # + payload - New vote to be added. 
    # + return - Success response. 
    remote isolated function postIdeaVotes(int id, ThoughtPost payload) returns ThoughtPostResponse|error {
        string  path = string `/ideas/${id}/votes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThoughtPostResponse response = check self.clientEp->post(path, request, targetType=ThoughtPostResponse);
        return response;
    }
    # Update workflow status of idea.
    #
    # + id - Numeric ID of the idea. 
    # + payload - New workflow status of the idea. 
    # + return - Success response. 
    remote isolated function postIdeaStatus(int id, IdeaStatusChangePost payload) returns IdeaStatusChangeResponse|error {
        string  path = string `/ideas/${id}/statuses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IdeaStatusChangeResponse response = check self.clientEp->post(path, request, targetType=IdeaStatusChangeResponse);
        return response;
    }
    # Get a list of user stories associated to the idea.
    #
    # + id - Numeric ID of the idea. 
    # + return - Success response. 
    remote isolated function getIdeaUserstories(int id) returns UserStories|error {
        string  path = string `/ideas/${id}/userstories`;
        UserStories response = check self.clientEp-> get(path, targetType = UserStories);
        return response;
    }
    # Get comments for an idea.
    #
    # + id - Numeric ID of the idea. 
    # + return - Success response. 
    remote isolated function getIdeaComments(int id) returns CommentList|error {
        string  path = string `/ideas/${id}/comments`;
        CommentList response = check self.clientEp-> get(path, targetType = CommentList);
        return response;
    }
    # Get a specific comment on an idea.
    #
    # + id - Numeric ID of the idea. 
    # + commentId - Numeric ID of the comment. 
    # + return - Success response. 
    remote isolated function putIdeaComment(int id, int commentId) returns InlineResponse2002|error {
        string  path = string `/ideas/${id}/comments/${commentId}`;
        InlineResponse2002 response = check self.clientEp-> get(path, targetType = InlineResponse2002);
        return response;
    }
    # Get feedback associated to an idea.
    #
    # + id - Numeric ID of the idea. 
    # + return - Success response. 
    remote isolated function getIdeaFeedback(int id) returns FeedbackList|error {
        string  path = string `/ideas/${id}/feedback`;
        FeedbackList response = check self.clientEp-> get(path, targetType = FeedbackList);
        return response;
    }
    # Get ideas linked to an idea.
    #
    # + id - Numeric ID of the idea. 
    # + return - Success response. 
    remote isolated function getIdeaRelatedIdeas(int id) returns RelatedIdeas|error {
        string  path = string `/ideas/${id}/ideas`;
        RelatedIdeas response = check self.clientEp-> get(path, targetType = RelatedIdeas);
        return response;
    }
    # Get the user stories in an account.
    #
    # + return - Success response. 
    remote isolated function getUserStories() returns UserStoryList|error {
        string  path = string `/userstories`;
        UserStoryList response = check self.clientEp-> get(path, targetType = UserStoryList);
        return response;
    }
    # Get the thoughts.
    #
    # + return - Success response. 
    remote isolated function getThoughts() returns ThoughtList|error {
        string  path = string `/votes`;
        ThoughtList response = check self.clientEp-> get(path, targetType = ThoughtList);
        return response;
    }
    # Create a new thought on an idea.
    #
    # + payload - New thought to be added 
    # + return - Success response. 
    remote isolated function postThoughts(ThoughtPost payload) returns ThoughtPostResponse|error {
        string  path = string `/votes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThoughtPostResponse response = check self.clientEp->post(path, request, targetType=ThoughtPostResponse);
        return response;
    }
    # Get a list of Personas
    #
    # + return - Success response. 
    remote isolated function getPersonas() returns PersonaList|error {
        string  path = string `/personas`;
        PersonaList response = check self.clientEp-> get(path, targetType = PersonaList);
        return response;
    }
    # Get a persona.
    #
    # + id - Numeric ID of the persona. 
    # + return - Success response. 
    remote isolated function getPersona(int id) returns Persona|error {
        string  path = string `/personas/${id}`;
        Persona response = check self.clientEp-> get(path, targetType = Persona);
        return response;
    }
    # List products.
    #
    # + 'group - Whether the returned list is grouped by product lines or not. 
    # + return - Success response. 
    remote isolated function getProducts(boolean 'group = false) returns InlineResponse2003|error {
        string  path = string `/products`;
        map<anydata> queryParam = {"group": 'group};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp-> get(path, targetType = InlineResponse2003);
        return response;
    }
    # Get a product.
    #
    # + id - Numeric ID of the product. 
    # + return - Success response. 
    remote isolated function getProduct(int id) returns Product|error {
        string  path = string `/products/${id}`;
        Product response = check self.clientEp-> get(path, targetType = Product);
        return response;
    }
    # Get a product roadmap
    #
    # + id - Numeric ID of the product. 
    # + return - Success response. 
    remote isolated function getProductRoadmap(int id) returns Roadmap|error {
        string  path = string `/products/${id}/roadmap`;
        Roadmap response = check self.clientEp-> get(path, targetType = Roadmap);
        return response;
    }
    # Get a list of the roadmaps.
    #
    # + return - Success response. 
    remote isolated function getRoadmaps() returns RoadmapList|error {
        string  path = string `/roadmaps`;
        RoadmapList response = check self.clientEp-> get(path, targetType = RoadmapList);
        return response;
    }
    # Get an individual roadmap.
    #
    # + id - Numeric ID of the roadmap. 
    # + return - Success response. 
    remote isolated function getRoadmap(int id) returns Roadmap|error {
        string  path = string `/roadmaps/${id}`;
        Roadmap response = check self.clientEp-> get(path, targetType = Roadmap);
        return response;
    }
    # Create roadmap card.
    #
    # + id - Numeric ID of the roadmap. 
    # + payload - Details of roadmap card. 
    # + return - Success response. 
    remote isolated function postRoadmapCard(int id, RoadmapCardPost payload) returns RoadmapCardPostResponse|error {
        string  path = string `/roadmaps/${id}/cards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RoadmapCardPostResponse response = check self.clientEp->post(path, request, targetType=RoadmapCardPostResponse);
        return response;
    }
    # Get a roadmap card.
    #
    # + id - Numeric ID of the roadmap. 
    # + cardid - Numeric ID of the card. 
    # + return - Success response. 
    remote isolated function getRoadmapCard(int id, int cardid) returns RoadmapCardColumn|error {
        string  path = string `/roadmaps/${id}/cards/${cardid}`;
        RoadmapCardColumn response = check self.clientEp-> get(path, targetType = RoadmapCardColumn);
        return response;
    }
    # Edit a roadmap card.
    #
    # + id - Numeric ID of the roadmap. 
    # + cardid - Numeric ID of the roadmap card. 
    # + payload - The card details to change. 
    # + return - Success response. 
    remote isolated function putRoadmapCard(int id, int cardid, RoadmapCardPost payload) returns RoadmapCardColumn|error {
        string  path = string `/roadmaps/${id}/cards/${cardid}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RoadmapCardColumn response = check self.clientEp->put(path, request, targetType=RoadmapCardColumn);
        return response;
    }
    # Get list of objectives.
    #
    # + return - Success response. 
    remote isolated function getObjectives() returns ObjectiveList|error {
        string  path = string `/objectives`;
        ObjectiveList response = check self.clientEp-> get(path, targetType = ObjectiveList);
        return response;
    }
    # Create a new objective.
    #
    # + payload - Objective details. 
    # + return - Success response. 
    remote isolated function postObjectives(ObjectivePost payload) returns Objective|error {
        string  path = string `/objectives`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Objective response = check self.clientEp->post(path, request, targetType=Objective);
        return response;
    }
    # Get an objective.
    #
    # + id - UUID of the objective. 
    # + return - Success response. 
    remote isolated function getObjective(string id) returns Objective|error {
        string  path = string `/objectives/${id}`;
        Objective response = check self.clientEp-> get(path, targetType = Objective);
        return response;
    }
    # Edit an objective.
    #
    # + id - UUID of the objective. 
    # + payload - Details of objective to be changed. 
    # + return - Success response. 
    remote isolated function putObjective(string id, ObjectivePost payload) returns Objective|error {
        string  path = string `/objectives/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Objective response = check self.clientEp->put(path, request, targetType=Objective);
        return response;
    }
    # Get a list of tags.
    #
    # + return - Success response. 
    remote isolated function getTags() returns TagList|error {
        string  path = string `/tags`;
        TagList response = check self.clientEp-> get(path, targetType = TagList);
        return response;
    }
    # Get a tag.
    #
    # + id - Numeric ID of the tag. 
    # + return - Success response. 
    remote isolated function getTag(int id) returns Tag|error {
        string  path = string `/tags/${id}`;
        Tag response = check self.clientEp-> get(path, targetType = Tag);
        return response;
    }
    # Get a list of workflow statuses.
    #
    # + return - Success response. 
    remote isolated function getStatuses() returns StatusList|error {
        string  path = string `/statuses`;
        StatusList response = check self.clientEp-> get(path, targetType = StatusList);
        return response;
    }
    # Get a workflow status.
    #
    # + id - Numeric ID of the workflow status. 
    # + return - Success response. 
    remote isolated function getStatus(int id) returns Status|error {
        string  path = string `/statuses/${id}`;
        Status response = check self.clientEp-> get(path, targetType = Status);
        return response;
    }
    # Search across ideas, products, personas and feedback.
    #
    # + q - Query to search for. 
    # + page - Page of results. 
    # + size - Number of entries per page of results. 
    # + 'type - Limit the search results to ideas, products, personas or feedback. Default is all. 
    # + return - Success response. 
    remote isolated function getSearch(string q, int? page = (), int? size = (), string? 'type = ()) returns SearchResults|error {
        string  path = string `/search`;
        map<anydata> queryParam = {"q": q, "page": page, "size": size, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        SearchResults response = check self.clientEp-> get(path, targetType = SearchResults);
        return response;
    }
    # Get a list of users.
    #
    # + return - Success response. 
    remote isolated function getUsers() returns UserList|error {
        string  path = string `/users`;
        UserList response = check self.clientEp-> get(path, targetType = UserList);
        return response;
    }
    # Create a new user.
    #
    # + payload - User details. 
    # + return - Success response. 
    remote isolated function postUsers(UserPost payload) returns User|error {
        string  path = string `/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->post(path, request, targetType=User);
        return response;
    }
    # Get a user.
    #
    # + id - Numeric ID of the user. 
    # + return - Success response. 
    remote isolated function getUser(int id) returns User|error {
        string  path = string `/user/${id}`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
}
