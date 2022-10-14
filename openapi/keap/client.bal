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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.infusionsoft.com/token";
|};

# This is a generated connector for [Keap API v1.70.0.453309-hf-202203291431](https://developer.infusionsoft.com/docs/rest/) OpenAPI specification.
# Keap is an all-in-one CRM, sales and marketing automation software that helps organize leads, land the job, get paid, and keep growing.
@display {label: "Keap", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Keap account](https://developer.keap.com) and obtain tokens by following [this guide](https://developer.infusionsoft.com/developer-guide).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.infusionsoft.com/crm/rest/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieve account profile
    #
    # + return - OK 
    remote isolated function getAccountProfile() returns AccountProfile|error {
        string resourcePath = string `/account/profile`;
        AccountProfile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an account profile
    #
    # + payload - accountInfo 
    # + return - OK 
    remote isolated function updateAccountInfo(AccountProfile payload) returns AccountProfile|error {
        string resourcePath = string `/account/profile`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountProfile response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List Affiliates
    #
    # + name - Optional affiliate name to query on 
    # + code - Optional affiliate parent ID to query on 
    # + parentId - Optional affiliate code to query on 
    # + contactId - Optional contact ID to query on 
    # + programId - Optional affiliate program ID to query on 
    # + status - Optional affiliate status to query on 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + offset - Count to offset the returned results by 
    # + 'limit - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listAffiliates(string? name = (), string? code = (), string? parentId = (), string? contactId = (), string? programId = (), string? status = (), string? 'order = (), string? orderDirection = (), int? offset = (), int? 'limit = ()) returns AffiliateList|error {
        string resourcePath = string `/affiliates`;
        map<anydata> queryParam = {"name": name, "code": code, "parent_id": parentId, "contact_id": contactId, "program_id": programId, "status": status, "order": 'order, "order_direction": orderDirection, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AffiliateList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an affiliate
    #
    # + payload - affiliate 
    # + return - Created 
    remote isolated function createAffiliate(CreateAffiliate payload) returns Affiliate|error {
        string resourcePath = string `/affiliates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Affiliate response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List Commissions
    #
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + affiliateId - Affiliate to retrieve commissions for 
    # + return - OK 
    remote isolated function listCommissions(string? since = (), string? until = (), string? 'order = (), string? orderDirection = (), int? 'limit = (), int? offset = (), int? affiliateId = ()) returns AffiliateCommissionList|error {
        string resourcePath = string `/affiliates/commissions`;
        map<anydata> queryParam = {"since": since, "until": until, "order": 'order, "order_direction": orderDirection, "limit": 'limit, "offset": offset, "affiliateId": affiliateId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AffiliateCommissionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Affiliate Model
    #
    # + return - OK 
    remote isolated function retrieveAffiliateModel() returns ObjectModel|error {
        string resourcePath = string `/affiliates/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Commission Programs
    #
    # + affiliateId - Id of the affiliate you would like programs for 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + offset - Count to offset the returned results by 
    # + 'limit - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listPrograms(int? affiliateId = (), string? 'order = (), string? orderDirection = (), int? offset = (), int? 'limit = ()) returns AffiliateProgramList|error {
        string resourcePath = string `/affiliates/programs`;
        map<anydata> queryParam = {"affiliate_id": affiliateId, "order": 'order, "order_direction": orderDirection, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AffiliateProgramList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Affiliate Redirects
    #
    # + affiliateId - Affiliate ID to search by 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + offset - Count to offset the returned results by 
    # + 'limit - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listAffiliateRedirectLinks(string? affiliateId = (), string? 'order = (), string? orderDirection = (), int? offset = (), int? 'limit = ()) returns RedirectList|error {
        string resourcePath = string `/affiliates/redirectlinks`;
        map<anydata> queryParam = {"affiliate_id": affiliateId, "order": 'order, "order_direction": orderDirection, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RedirectList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List affiliate summaries
    #
    # + affiliateIds - Ids of the affiliates you would like a summary for 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + return - OK 
    remote isolated function listSummaries(int[]? affiliateIds = (), string? 'order = (), string? orderDirection = ()) returns AffiliateSummaryList|error {
        string resourcePath = string `/affiliates/summaries`;
        map<anydata> queryParam = {"affiliate_ids": affiliateIds, "order": 'order, "order_direction": orderDirection};
        map<Encoding> queryParamEncoding = {"affiliate_ids": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AffiliateSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Affiliate clawbacks
    #
    # + affiliateId - affiliateId 
    # + since - Optional inclusive start date 
    # + until - Optional inclusive end date 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + offset - Count to offset the returned results by 
    # + 'limit - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listAffiliateClawbacks(string affiliateId, string? since = (), string? until = (), string? 'order = (), string? orderDirection = (), int? offset = (), int? 'limit = ()) returns AffiliateClawbackList|error {
        string resourcePath = string `/affiliates/${getEncodedUri(affiliateId)}/clawbacks`;
        map<anydata> queryParam = {"since": since, "until": until, "order": 'order, "order_direction": orderDirection, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AffiliateClawbackList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an affiliate
    #
    # + id - id 
    # + return - OK 
    remote isolated function getAffiliate(int id) returns Affiliate|error {
        string resourcePath = string `/affiliates/${getEncodedUri(id)}`;
        Affiliate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Appointments
    #
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + contactId - Optionally find appointments with a contact 
    # + return - OK 
    remote isolated function listAppointments(string? since = (), string? until = (), int? 'limit = (), int? offset = (), int? contactId = ()) returns AppointmentList|error {
        string resourcePath = string `/appointments`;
        map<anydata> queryParam = {"since": since, "until": until, "limit": 'limit, "offset": offset, "contact_id": contactId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AppointmentList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an Appointment
    #
    # + payload - appointment 
    # + return - Created 
    remote isolated function createAppointment(Appointment payload) returns Appointment|error {
        string resourcePath = string `/appointments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Appointment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Appointment Model
    #
    # + return - OK 
    remote isolated function retrieveAppointmentModel() returns ObjectModel|error {
        string resourcePath = string `/appointments/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Custom Field
    #
    # + payload - customField 
    # + return - Created 
    remote isolated function createAppointmentCustomField(CreateRestCustomField payload) returns CustomFieldMetaData|error {
        string resourcePath = string `/appointments/model/customFields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomFieldMetaData response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an Appointment
    #
    # + appointmentId - appointmentId 
    # + return - OK 
    remote isolated function getAppointment(int appointmentId) returns Appointment|error {
        string resourcePath = string `/appointments/${getEncodedUri(appointmentId)}`;
        Appointment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace an Appointment
    #
    # + appointmentId - appointmentId 
    # + payload - appointmentDTO 
    # + return - OK 
    remote isolated function updateAppointment(int appointmentId, Appointment payload) returns Appointment|error {
        string resourcePath = string `/appointments/${getEncodedUri(appointmentId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Appointment response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an Appointment
    #
    # + appointmentId - appointmentId 
    # + return - No Content 
    remote isolated function deleteAppointment(int appointmentId) returns http:Response|error {
        string resourcePath = string `/appointments/${getEncodedUri(appointmentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update an Appointment
    #
    # + appointmentId - appointmentId 
    # + payload - appointmentDTO 
    # + return - OK 
    remote isolated function updatePropertiesOnAppointment(int appointmentId, Appointment payload) returns Appointment|error {
        string resourcePath = string `/appointments/${getEncodedUri(appointmentId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Appointment response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List Campaigns
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + searchText - Optional text to search 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + return - OK 
    remote isolated function listCampaigns(int? 'limit = (), int? offset = (), string? searchText = (), string? 'order = (), string? orderDirection = ()) returns CampaignList|error {
        string resourcePath = string `/campaigns`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "search_text": searchText, "order": 'order, "order_direction": orderDirection};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CampaignList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Achieve API Goal
    #
    # + integration - integration 
    # + callName - callName 
    # + payload - goalEvent 
    # + return - Created 
    remote isolated function createAchieveApiGoalEvent(string integration, string callName, AchieveApiGoalEvent payload) returns GoalEventResultDTO[]|error {
        string resourcePath = string `/campaigns/goals/${getEncodedUri(integration)}/${getEncodedUri(callName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoalEventResultDTO[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a Campaign
    #
    # + campaignId - campaignId 
    # + optionalProperties - Comma-delimited list of Campaign properties to include in the response. (The fields `goals` and `sequences` aren't included, by default.) 
    # + return - OK 
    remote isolated function getCampaign(int campaignId, string[]? optionalProperties = ()) returns Campaign|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}`;
        map<anydata> queryParam = {"optional_properties": optionalProperties};
        map<Encoding> queryParamEncoding = {"optional_properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Campaign response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add Multiple to Campaign Sequence
    #
    # + campaignId - campaignId 
    # + sequenceId - sequenceId 
    # + payload - ids 
    # + return - OK 
    remote isolated function addContactsToCampaignSequence(int campaignId, int sequenceId, SetOfIds payload) returns json|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/sequences/${getEncodedUri(sequenceId)}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add to Campaign Sequence
    #
    # + campaignId - campaignId 
    # + sequenceId - sequenceId 
    # + contactId - contactId 
    # + return - No Content 
    remote isolated function addContactToCampaignSequence(int campaignId, int sequenceId, int contactId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/sequences/${getEncodedUri(sequenceId)}/contacts/${getEncodedUri(contactId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Remove from Campaign Sequence
    #
    # + campaignId - campaignId 
    # + sequenceId - sequenceId 
    # + contactId - contactId 
    # + return - No Content 
    remote isolated function removeContactFromCampaignSequence(int campaignId, int sequenceId, int contactId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/sequences/${getEncodedUri(sequenceId)}/contacts/${getEncodedUri(contactId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List Companies
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + companyName - Optional company name to query on 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + optionalProperties - Comma-delimited list of Company properties to include in the response. (Fields such as `notes`, `fax_number` and `custom_fields` aren't included, by default.) 
    # + return - OK 
    remote isolated function listCompanies(int? 'limit = (), int? offset = (), string? companyName = (), string? 'order = (), string? orderDirection = (), string[]? optionalProperties = ()) returns CompanyList|error {
        string resourcePath = string `/companies`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "company_name": companyName, "order": 'order, "order_direction": orderDirection, "optional_properties": optionalProperties};
        map<Encoding> queryParamEncoding = {"optional_properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CompanyList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Company
    #
    # + payload - company 
    # + return - Created 
    remote isolated function createCompany(CreateOrPatchCompany payload) returns Company|error {
        string resourcePath = string `/companies`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Company response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Company Model
    #
    # + return - OK 
    remote isolated function retrieveCompanyModel() returns ObjectModel|error {
        string resourcePath = string `/companies/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Company
    #
    # + companyId - companyId 
    # + optionalProperties - Comma-delimited list of Company properties to include in the response. (Fields such as `notes`, `fax_number` and `custom_fields` aren't included, by default.) 
    # + return - OK 
    remote isolated function getCompany(int companyId, string[]? optionalProperties = ()) returns Company|error {
        string resourcePath = string `/companies/${getEncodedUri(companyId)}`;
        map<anydata> queryParam = {"optional_properties": optionalProperties};
        map<Encoding> queryParamEncoding = {"optional_properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Company response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a Company
    #
    # + companyId - companyId 
    # + payload - company 
    # + return - OK 
    remote isolated function updateCompanies(int companyId, CreateOrPatchCompany payload) returns Company|error {
        string resourcePath = string `/companies/${getEncodedUri(companyId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Company response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Update a Company
    #
    # + companyId - companyId 
    # + payload - company 
    # + return - OK 
    remote isolated function updateCompany(int companyId, CreateOrPatchCompany payload) returns Company|error {
        string resourcePath = string `/company/${getEncodedUri(companyId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Company response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List Contacts
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + email - Optional email address to query on 
    # + givenName - Optional first name or forename to query on 
    # + familyName - Optional last name or surname to query on 
    # + 'order - Attribute to order items by 
    # + orderDirection - How to order the data i.e. ascending (A-Z) or descending (Z-A) 
    # + since - Date to start searching from on LastUpdated ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to on LastUpdated ex. `2017-01-01T22:17:59.039Z` 
    # + optionalProperties - Comma-delimited list of Contact properties to include in the response. (Some fields such as `lead_source_id`, `custom_fields`, and `job_title` aren't included, by default.) 
    # + return - OK 
    remote isolated function listContacts(int? 'limit = (), int? offset = (), string? email = (), string? givenName = (), string? familyName = (), string? 'order = (), string? orderDirection = (), string? since = (), string? until = (), string[]? optionalProperties = ()) returns ContactList|error {
        string resourcePath = string `/contacts`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "email": email, "given_name": givenName, "family_name": familyName, "order": 'order, "order_direction": orderDirection, "since": since, "until": until, "optional_properties": optionalProperties};
        map<Encoding> queryParamEncoding = {"optional_properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ContactList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create or Update a Contact
    #
    # + payload - contact 
    # + return - OK 
    remote isolated function createOrUpdateContact(UpsertContact payload) returns FullContact|error {
        string resourcePath = string `/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullContact response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create a Contact
    #
    # + payload - contact 
    # + return - Created 
    remote isolated function createContact(CreateOrPatchContact payload) returns FullContact|error {
        string resourcePath = string `/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullContact response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Contact Model
    #
    # + return - OK 
    remote isolated function retrieveContactModel() returns ObjectModel|error {
        string resourcePath = string `/contacts/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Custom Field
    #
    # + payload - customField 
    # + return - Created 
    remote isolated function createCustomField(CreateRestCustomField payload) returns CustomFieldMetaData|error {
        string resourcePath = string `/contacts/model/customFields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomFieldMetaData response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a Contact
    #
    # + contactId - contactId 
    # + return - No Content 
    remote isolated function deleteContact(int contactId) returns http:Response|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a Contact
    #
    # + contactId - contactId 
    # + updateMask - An optional list of properties to be updated. If set, only the provided properties will be updated and others will be skipped. 
    # + payload - contact 
    # + return - OK 
    remote isolated function updatePropertiesOnContact(int contactId, CreateOrPatchContact payload, string[]? updateMask = ()) returns FullContact|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}`;
        map<anydata> queryParam = {"update_mask": updateMask};
        map<Encoding> queryParamEncoding = {"update_mask": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullContact response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve Credit Cards
    #
    # + contactId - contactId 
    # + return - OK 
    remote isolated function listCreditCards(int contactId) returns ContactCreditCard[]|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/creditCards`;
        ContactCreditCard[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Credit Card
    #
    # + contactId - contactId 
    # + payload - creditCard 
    # + return - Created 
    remote isolated function createCreditCard(int contactId, CreditCard payload) returns CreditCardAdded|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/creditCards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreditCardAdded response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List Emails
    #
    # + contactId - contactId 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + email - Optional email address to query on 
    # + return - OK 
    remote isolated function listEmailsForContact(int contactId, int? 'limit = (), int? offset = (), string? email = ()) returns EmailSentQueryResultList|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/emails`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailSentQueryResultList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an Email Record
    #
    # + contactId - contactId 
    # + payload - Email records to persist, with content. 
    # + return - Created 
    remote isolated function createEmailForContact(int contactId, EmailSentCreate payload) returns EmailSentCreate|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/emails`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailSentCreate response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List Applied Tags
    #
    # + contactId - contactId 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listAppliedTags(int contactId, int? 'limit = (), int? offset = ()) returns ContactTagList|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/tags`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactTagList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Apply Tags
    #
    # + contactId - contactId 
    # + payload - tagIds 
    # + return - OK 
    remote isolated function applyTagsToContactId(int contactId, TagId payload) returns EntryLongString[]|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntryLongString[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove Applied Tags
    #
    # + contactId - contactId 
    # + ids - ids 
    # + return - No Content 
    remote isolated function removeAppliedTagsFromContact(int contactId, string ids) returns http:Response|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/tags`;
        map<anydata> queryParam = {"ids": ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Remove Applied Tag
    #
    # + contactId - contactId 
    # + tagId - tagId 
    # + return - No Content 
    remote isolated function removeTagsFromContact(int contactId, int tagId) returns http:Response|error {
        string resourcePath = string `/contacts/${getEncodedUri(contactId)}/tags/${getEncodedUri(tagId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Replace an Email Address
    #
    # + email - email 
    # + payload - update 
    # + return - OK 
    remote isolated function replaceEmailAddress(string email, UpdateEmailAddress payload) returns RestEmailAddress|error {
        string resourcePath = string `/emailAddresses/${getEncodedUri(email)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RestEmailAddress response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List Emails
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + contactId - Optional Contact Id to find Emails for 
    # + email - Optional email address to query on 
    # + sinceSentDate - Optional date to query on, emails sent since the provided date, must be present if untilDate is provided 
    # + untilSentDate - Optional date to query on, email sent until the provided date 
    # + ordered - Optional boolean to turn off ORDER BY in SQL query 
    # + return - OK 
    remote isolated function listEmails(int? 'limit = (), int? offset = (), int? contactId = (), string? email = (), string? sinceSentDate = (), string? untilSentDate = (), boolean ordered = true) returns EmailSentQueryResultList|error {
        string resourcePath = string `/emails`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "contact_id": contactId, "email": email, "since_sent_date": sinceSentDate, "until_sent_date": untilSentDate, "ordered": ordered};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmailSentQueryResultList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an Email Record
    #
    # + payload - Email records to persist, with content. 
    # + return - Created 
    remote isolated function createEmail(EmailSentCreate payload) returns EmailSentCreate|error {
        string resourcePath = string `/emails`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailSentCreate response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Send an Email
    #
    # + payload - emailSendRequest 
    # + return - Accepted 
    remote isolated function sendEmail(EmailSendRequest payload) returns http:Response|error {
        string resourcePath = string `/emails/queue`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a set of Email Records
    #
    # + payload - Email records to persist, with content. 
    # + return - Created 
    remote isolated function createEmails(EmailSentCreateList payload) returns EmailSentCreateList|error {
        string resourcePath = string `/emails/sync`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailSentCreateList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Un-sync a batch of Email Records
    #
    # + payload - emailIds 
    # + return - OK 
    remote isolated function deleteEmails(SetOfIds payload) returns json|error {
        string resourcePath = string `/emails/unsync`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an Email
    #
    # + id - id 
    # + return - OK 
    remote isolated function getEmail(int id) returns EmailSentQueryResultWithContent|error {
        string resourcePath = string `/emails/${getEncodedUri(id)}`;
        EmailSentQueryResultWithContent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an Email Record
    #
    # + id - id 
    # + payload - Email records to persist, with content. 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function updateEmail(int id, EmailSentCreate payload) returns EmailSentCreate|error {
        string resourcePath = string `/emails/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmailSentCreate response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an Email Record
    #
    # + id - id 
    # + return - No Content 
    remote isolated function deleteEmail(int id) returns http:Response|error {
        string resourcePath = string `/emails/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List Files
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + viewable - Include public or private files in response (PUBLIC or PRIVATE), defaults to BOTH. 
    # + permission - Filter based on the permission of files (USER or COMPANY), defaults to BOTH. 
    # + 'type - Filter based on the type of file. 
    # + name - Filter files based on name, with '*' preceding or following to indicate LIKE queries. 
    # + contactId - Filter based on Contact Id, if user has permission to see Contact files. 
    # + return - OK 
    remote isolated function listFiles(int? 'limit = (), int? offset = (), string? viewable = (), string? permission = (), string? 'type = (), string? name = (), int? contactId = ()) returns FileList|error {
        string resourcePath = string `/files`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "viewable": viewable, "permission": permission, "type": 'type, "name": name, "contact_id": contactId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FileList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Upload File
    #
    # + payload - fileUpload 
    # + return - OK 
    remote isolated function createFile(FileUpload payload) returns FileInformation|error {
        string resourcePath = string `/files`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve File
    #
    # + fileId - fileId 
    # + optionalProperties - Comma-delimited list of File properties to include in the response. (Some fields such as `file_data` aren't included, by default.) 
    # + return - OK 
    remote isolated function getFile(int fileId, string[]? optionalProperties = ()) returns FileInformation|error {
        string resourcePath = string `/files/${getEncodedUri(fileId)}`;
        map<anydata> queryParam = {"optional_properties": optionalProperties};
        map<Encoding> queryParamEncoding = {"optional_properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FileInformation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace File
    #
    # + fileId - fileId 
    # + payload - fileUpload 
    # + return - OK 
    remote isolated function updateFile(int fileId, FileUpload payload) returns FileInformation|error {
        string resourcePath = string `/files/${getEncodedUri(fileId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete File
    #
    # + fileId - fileId 
    # + return - No Content 
    remote isolated function deleteFile(int fileId) returns http:Response|error {
        string resourcePath = string `/files/${getEncodedUri(fileId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List Stored Hook Subscriptions
    #
    # + return - OK 
    remote isolated function listStoredHookSubscriptions() returns RestHook[]|error {
        string resourcePath = string `/hooks`;
        RestHook[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Hook Subscription
    #
    # + payload - restHookRequest 
    # + return - OK 
    remote isolated function createAHookSubscription(RestHookRequest payload) returns RestHook|error {
        string resourcePath = string `/hooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RestHook response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List Hook Event Types
    #
    # + return - OK 
    remote isolated function listHookEventTypes() returns string[]|error {
        string resourcePath = string `/hooks/event_keys`;
        string[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Hook Subscription
    #
    # + 'key - key 
    # + return - OK 
    remote isolated function retrieveAHookSubscription(string 'key) returns RestHook|error {
        string resourcePath = string `/hooks/${getEncodedUri('key)}`;
        RestHook response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a Hook Subscription
    #
    # + 'key - key 
    # + payload - restHookRequest 
    # + return - OK 
    remote isolated function updateAHookSubscription(string 'key, RestHookRequest payload) returns RestHook|error {
        string resourcePath = string `/hooks/${getEncodedUri('key)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RestHook response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a Hook Subscription
    #
    # + 'key - key 
    # + return - No Content 
    remote isolated function deleteAHookSubscription(string 'key) returns http:Response|error {
        string resourcePath = string `/hooks/${getEncodedUri('key)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Verify a Hook Subscription, Delayed
    #
    # + 'key - key 
    # + xHookSecret - X-Hook-Secret 
    # + return - OK 
    remote isolated function verifyAHookSubscriptionDelayed(string 'key, string xHookSecret) returns RestHook|error {
        string resourcePath = string `/hooks/${getEncodedUri('key)}/delayedVerify`;
        map<any> headerValues = {"X-Hook-Secret": xHookSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        RestHook response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Verify a Hook Subscription
    #
    # + 'key - key 
    # + return - OK 
    remote isolated function verifyAHookSubscription(string 'key) returns RestHook|error {
        string resourcePath = string `/hooks/${getEncodedUri('key)}/verify`;
        http:Request request = new;
        //TODO: Update the request as needed;
        RestHook response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List Countries
    #
    # + return - OK 
    remote isolated function listCountries() returns CountriesByCode|error {
        string resourcePath = string `/locales/countries`;
        CountriesByCode response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List a Country's Provinces
    #
    # + countryCode - countryCode 
    # + return - OK 
    remote isolated function listCountriesProvinces(string countryCode) returns ProvincesByCode|error {
        string resourcePath = string `/locales/countries/${getEncodedUri(countryCode)}/provinces`;
        ProvincesByCode response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Merchants
    #
    # + return - OK 
    remote isolated function getMerchantAccounts() returns RestMerchantAccountResponse|error {
        string resourcePath = string `/merchants`;
        RestMerchantAccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Notes
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + userId - Filter based on the user id assigned to the note. 
    # + contactId - Filter based on the contact id assigned to the note. 
    # + return - OK 
    remote isolated function listNotes(int? 'limit = (), int? offset = (), int? userId = (), int? contactId = ()) returns NoteList|error {
        string resourcePath = string `/notes`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "user_id": userId, "contact_id": contactId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NoteList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Note
    #
    # + payload - createNote 
    # + return - Created 
    remote isolated function createNote(RequestNote payload) returns Note|error {
        string resourcePath = string `/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Note response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Note Model
    #
    # + return - OK 
    remote isolated function retrieveNoteModel() returns ObjectModel|error {
        string resourcePath = string `/notes/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Custom Field
    #
    # + payload - customField 
    # + return - Created 
    remote isolated function createNoteCustomField(CreateRestCustomField payload) returns CustomFieldMetaData|error {
        string resourcePath = string `/notes/model/customFields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomFieldMetaData response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a Note
    #
    # + noteId - noteId 
    # + return - OK 
    remote isolated function getNote(int noteId) returns Note|error {
        string resourcePath = string `/notes/${getEncodedUri(noteId)}`;
        Note response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Note
    #
    # + noteId - noteId 
    # + return - No Content 
    remote isolated function deleteNote(int noteId) returns http:Response|error {
        string resourcePath = string `/notes/${getEncodedUri(noteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a Note
    #
    # + noteId - noteId 
    # + payload - note 
    # + return - OK 
    remote isolated function updatePropertiesOnNote(int noteId, UpdateNote payload) returns Note|error {
        string resourcePath = string `/notes/${getEncodedUri(noteId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Note response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve User Info
    #
    # + return - OK 
    remote isolated function getUserInfo() returns UserInfoDTO|error {
        string resourcePath = string `/oauth/connect/userinfo`;
        UserInfoDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Opportunities
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + userId - Returns opportunities for the provided user id 
    # + stageId - Returns opportunities for the provided stage id 
    # + searchTerm - Returns opportunities that match any of the contact's `given_name`, `family_name`, `company_name`, and `email_addresses` (searches `EMAIL1` only) fields as well as `opportunity_title` 
    # + 'order - Attribute to order items by 
    # + return - OK 
    remote isolated function listOpportunities(int? 'limit = (), int? offset = (), int? userId = (), int? stageId = (), string? searchTerm = (), string? 'order = ()) returns OpportunityList|error {
        string resourcePath = string `/opportunities`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "user_id": userId, "stage_id": stageId, "search_term": searchTerm, "order": 'order};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OpportunityList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace an Opportunity
    #
    # + payload - opportunity 
    # + return - OK 
    remote isolated function updateOpportunity(Opportunity payload) returns Opportunity|error {
        string resourcePath = string `/opportunities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Opportunity response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create an Opportunity
    #
    # + payload - opportunity 
    # + return - OK 
    remote isolated function createOpportunity(Opportunity payload) returns Opportunity|error {
        string resourcePath = string `/opportunities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Opportunity response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Opportunity Model
    #
    # + return - OK 
    remote isolated function retrieveOpportunityModel() returns ObjectModel|error {
        string resourcePath = string `/opportunities/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an Opportunity
    #
    # + opportunityId - opportunityId 
    # + optionalProperties - Comma-delimited list of Opportunity properties to include in the response. (Some fields such as `custom_fields` aren't included, by default.) 
    # + return - OK 
    remote isolated function getOpportunity(int opportunityId, string[]? optionalProperties = ()) returns Opportunity|error {
        string resourcePath = string `/opportunities/${getEncodedUri(opportunityId)}`;
        map<anydata> queryParam = {"optional_properties": optionalProperties};
        map<Encoding> queryParamEncoding = {"optional_properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Opportunity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an Opportunity
    #
    # + opportunityId - opportunityId 
    # + payload - opportunity 
    # + return - OK 
    remote isolated function updatePropertiesOnOpportunity(int opportunityId, Opportunity payload) returns Opportunity|error {
        string resourcePath = string `/opportunities/${getEncodedUri(opportunityId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Opportunity response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List Opportunity Stage Pipeline
    #
    # + return - OK 
    remote isolated function listOpportunityStagePipelines() returns SalesPipeline[]|error {
        string resourcePath = string `/opportunity/stage_pipeline`;
        SalesPipeline[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Orders
    #
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + paid - Sets paid status of items to return 
    # + 'order - Attribute to order items by 
    # + contactId - Returns orders for the provided contact id 
    # + productId - Returns orders containing the provided product id 
    # + contactName - Returns orders for the provided contact name 
    # + return - OK 
    remote isolated function listOrders(string? since = (), string? until = (), int? 'limit = (), int? offset = (), boolean? paid = (), string? 'order = (), int? contactId = (), int? productId = (), string? contactName = ()) returns OrderList|error {
        string resourcePath = string `/orders`;
        map<anydata> queryParam = {"since": since, "until": until, "limit": 'limit, "offset": offset, "paid": paid, "order": 'order, "contact_id": contactId, "product_id": productId, "contact_name": contactName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrderList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an Order
    #
    # + payload - createOrder 
    # + return - Created 
    remote isolated function createOrder(CreateOrder payload) returns Order|error {
        string resourcePath = string `/orders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Custom Order Model
    #
    # + return - OK 
    remote isolated function retrieveOrderModel() returns ObjectModel|error {
        string resourcePath = string `/orders/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an Order
    #
    # + orderId - orderId 
    # + return - OK 
    remote isolated function getOrder(int orderId) returns EcommerceReportingOrder|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}`;
        EcommerceReportingOrder response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an Order
    #
    # + orderId - orderId 
    # + return - No Content 
    remote isolated function deleteOrder(int orderId) returns http:Response|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create an Order Item
    #
    # + orderId - orderId 
    # + payload - createOrderItem 
    # + return - Created 
    remote isolated function createOrderItemsOnOrder(int orderId, CreateOrderItem payload) returns OrderItem|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderItem response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete an Order Item
    #
    # + orderId - orderId 
    # + orderItemId - orderItemId 
    # + return - No Content 
    remote isolated function deleteOrderOrderItem(int orderId, int orderItemId) returns http:Response|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}/items/${getEncodedUri(orderItemId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Replace an Order Pay Plan
    #
    # + orderId - orderId 
    # + payload - paymentPlan 
    # + return - OK 
    remote isolated function replacePaymentPlan(int orderId, PaymentPlan payload) returns PaymentPlan|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}/paymentPlan`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentPlan response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Retrieve Order Payments
    #
    # + orderId - orderId 
    # + return - OK 
    remote isolated function listOrderPayments(int orderId) returns InvoicePayment[]|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}/payments`;
        InvoicePayment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Payment
    #
    # + orderId - orderId 
    # + payload - createPayment 
    # + return - Created 
    remote isolated function createPaymentOnOrder(int orderId, CreatePayment payload) returns PaymentResult|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}/payments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PaymentResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Order Transactions
    #
    # + orderId - orderId 
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + contactId - Returns transactions for the provided contact id 
    # + return - OK 
    remote isolated function listTransactionsForOrder(int orderId, string? since = (), string? until = (), int? 'limit = (), int? offset = (), int? contactId = ()) returns TransactionList|error {
        string resourcePath = string `/orders/${getEncodedUri(orderId)}/transactions`;
        map<anydata> queryParam = {"since": since, "until": until, "limit": 'limit, "offset": offset, "contact_id": contactId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransactionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Products
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + active - Sets status of items to return 
    # + return - OK 
    remote isolated function listProducts(int? 'limit = (), int? offset = (), boolean? active = ()) returns ProductList|error {
        string resourcePath = string `/products`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "active": active};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProductList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Product
    #
    # + payload - createProduct 
    # + return - Created 
    remote isolated function createProduct(CreateProduct payload) returns Product|error {
        string resourcePath = string `/products`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Synced Products
    #
    # + syncToken - sync_token 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function listProductsFromSyncToken(string? syncToken = (), int? 'limit = (), int? offset = ()) returns ProductStatusList|error {
        string resourcePath = string `/products/sync`;
        map<anydata> queryParam = {"sync_token": syncToken, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProductStatusList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Product
    #
    # + productId - productId 
    # + return - OK 
    remote isolated function retrieveProduct(int productId) returns Product|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}`;
        Product response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Product
    #
    # + productId - productId 
    # + return - No Content 
    remote isolated function deleteProduct(int productId) returns http:Response|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a Product
    #
    # + productId - productId 
    # + payload - createProduct 
    # + return - OK 
    remote isolated function updateProduct(int productId, CreateProduct payload) returns Product|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Product response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Upload a product image
    #
    # + productId - productId 
    # + payload - restProductImage 
    # + return - Created 
    remote isolated function createProductImage(int productId, CreateProductImage payload) returns http:Response|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}/image`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a product image
    #
    # + productId - productId 
    # + return - No Content 
    remote isolated function deleteProductImage(int productId) returns http:Response|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}/image`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a Product Subscription
    #
    # + productId - productId 
    # + payload - createProductSubscription 
    # + return - Created 
    remote isolated function createProductSubscription(int productId, CreateProductSubscription payload) returns ProductSubscription|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}/subscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductSubscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a Product Subscription
    #
    # + productId - productId 
    # + subscriptionId - subscriptionId 
    # + return - OK 
    remote isolated function retrieveProductSubscription(int productId, int subscriptionId) returns ProductSubscription|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}/subscriptions/${getEncodedUri(subscriptionId)}`;
        ProductSubscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Product Subscription
    #
    # + productId - productId 
    # + subscriptionId - subscriptionId 
    # + return - No Content 
    remote isolated function deleteProductSubscription(int productId, int subscriptionId) returns http:Response|error {
        string resourcePath = string `/products/${getEncodedUri(productId)}/subscriptions/${getEncodedUri(subscriptionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieve application configuration
    #
    # + return - OK 
    remote isolated function getConfiguration() returns RestApplicationConfiguration|error {
        string resourcePath = string `/setting/application/configuration`;
        RestApplicationConfiguration response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve application status
    #
    # + return - OK 
    remote isolated function getApplicationEnabled() returns Setting|error {
        string resourcePath = string `/setting/application/enabled`;
        Setting response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Contact types
    #
    # + return - OK 
    remote isolated function getContactOptionTypes() returns Setting|error {
        string resourcePath = string `/setting/contact/optionTypes`;
        Setting response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Subscriptions
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + contactId - Returns subscriptions for the provided contact id 
    # + return - OK 
    remote isolated function listSubscriptions(int? 'limit = (), int? offset = (), int? contactId = ()) returns SubscriptionList|error {
        string resourcePath = string `/subscriptions`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "contact_id": contactId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SubscriptionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Subscription
    #
    # + payload - createSubscription 
    # + return - Created 
    remote isolated function createSubscription(CreateSubscription payload) returns Subscription|error {
        string resourcePath = string `/subscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Subscription Model
    #
    # + return - OK 
    remote isolated function retrieveSubscriptionModel() returns ObjectModel|error {
        string resourcePath = string `/subscriptions/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Tags
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + category - Category Id of tags to filter by 
    # + name - Filter for tags with a specific name 
    # + return - OK 
    remote isolated function listTags(int? 'limit = (), int? offset = (), int? category = (), string? name = ()) returns Tags|error {
        string resourcePath = string `/tags`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "category": category, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Tags response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Tag
    #
    # + payload - tag 
    # + return - OK 
    remote isolated function createTag(CreateTag payload) returns Tag|error {
        string resourcePath = string `/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Tag response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create Tag Category
    #
    # + payload - tagCategory 
    # + return - OK 
    remote isolated function createTagCategory(CreateTagCategory payload) returns TagCategory|error {
        string resourcePath = string `/tags/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TagCategory response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a Tag
    #
    # + id - id 
    # + return - OK 
    remote isolated function getTag(int id) returns Tag|error {
        string resourcePath = string `/tags/${getEncodedUri(id)}`;
        Tag response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Tagged Companies
    #
    # + tagId - tagId 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listCompaniesForTagId(int tagId, int? 'limit = (), int? offset = ()) returns TaggedCompanyList|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}/companies`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaggedCompanyList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Tagged Contacts
    #
    # + tagId - tagId 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + return - OK 
    remote isolated function listContactsForTagId(int tagId, int? 'limit = (), int? offset = ()) returns TaggedContactList|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}/contacts`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaggedContactList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Apply Tag to Contacts
    #
    # + tagId - tagId 
    # + payload - ids 
    # + return - OK 
    remote isolated function applyTagToContactIds(int tagId, SetOfIds payload) returns EntryLongString[]|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntryLongString[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove Tag from Contacts
    #
    # + tagId - tagId 
    # + ids - ids 
    # + return - No Content 
    remote isolated function removeTagFromContactIds(int tagId, int[] ids) returns http:Response|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}/contacts`;
        map<anydata> queryParam = {"ids": ids};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Remove Tag from Contact
    #
    # + tagId - tagId 
    # + contactId - contactId 
    # + return - No Content 
    remote isolated function removeTagFromContactId(int tagId, int contactId) returns http:Response|error {
        string resourcePath = string `/tags/${getEncodedUri(tagId)}/contacts/${getEncodedUri(contactId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List Tasks
    #
    # + contactId - contact_id 
    # + hasDueDate - has_due_date 
    # + userId - user_id 
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + completed - Sets completed status of items to return 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + 'order - Attribute to order items by 
    # + return - OK 
    remote isolated function listTasks(int? contactId = (), boolean? hasDueDate = (), int? userId = (), string? since = (), string? until = (), boolean? completed = (), int? 'limit = (), int? offset = (), string? 'order = ()) returns TaskList|error {
        string resourcePath = string `/tasks`;
        map<anydata> queryParam = {"contact_id": contactId, "has_due_date": hasDueDate, "user_id": userId, "since": since, "until": until, "completed": completed, "limit": 'limit, "offset": offset, "order": 'order};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaskList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Task
    #
    # + payload - task 
    # + return - OK 
    remote isolated function createTask(Task payload) returns Task|error {
        string resourcePath = string `/tasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Task response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Task Model
    #
    # + return - OK 
    remote isolated function retrieveTaskModel() returns ObjectModel|error {
        string resourcePath = string `/tasks/model`;
        ObjectModel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Custom Field
    #
    # + payload - customField 
    # + return - Created 
    remote isolated function createTaskCustomField(CreateRestCustomField payload) returns CustomFieldMetaData|error {
        string resourcePath = string `/tasks/model/customFields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomFieldMetaData response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search Tasks
    #
    # + contactId - Returns tasks for the provided contact id 
    # + hasDueDate - Returns tasks that have an 'action date' when set to true 
    # + userId - Returns tasks for the provided user id 
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + completed - Sets completed status of items to return 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + 'order - Attribute to order items by 
    # + return - OK 
    remote isolated function listTasksForCurrentUser(int? contactId = (), boolean? hasDueDate = (), int? userId = (), string? since = (), string? until = (), boolean? completed = (), int? 'limit = (), int? offset = (), string? 'order = ()) returns TaskList|error {
        string resourcePath = string `/tasks/search`;
        map<anydata> queryParam = {"contact_id": contactId, "has_due_date": hasDueDate, "user_id": userId, "since": since, "until": until, "completed": completed, "limit": 'limit, "offset": offset, "order": 'order};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaskList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Task
    #
    # + taskId - taskId 
    # + return - OK 
    remote isolated function getTask(string taskId) returns Task|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskId)}`;
        Task response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace a Task
    #
    # + taskId - taskId 
    # + payload - task 
    # + return - OK 
    remote isolated function updateTask(string taskId, Task payload) returns Task|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Task response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a Task
    #
    # + taskId - taskId 
    # + return - No Content 
    remote isolated function deleteTask(string taskId) returns http:Response|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a Task
    #
    # + taskId - taskId 
    # + payload - task 
    # + return - OK 
    remote isolated function updatePropertiesOnTask(string taskId, Task payload) returns Task|error {
        string resourcePath = string `/tasks/${getEncodedUri(taskId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Task response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List Transactions
    #
    # + since - Date to start searching from ex. `2017-01-01T22:17:59.039Z` 
    # + until - Date to search to ex. `2017-01-01T22:17:59.039Z` 
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + contactId - Returns transactions for the provided contact id 
    # + return - OK 
    remote isolated function listTransactions(string? since = (), string? until = (), int? 'limit = (), int? offset = (), int? contactId = ()) returns TransactionList|error {
        string resourcePath = string `/transactions`;
        map<anydata> queryParam = {"since": since, "until": until, "limit": 'limit, "offset": offset, "contact_id": contactId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransactionList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Transaction
    #
    # + transactionId - transactionId 
    # + return - OK 
    remote isolated function getTransaction(int transactionId) returns EcommerceReportingTransaction|error {
        string resourcePath = string `/transactions/${getEncodedUri(transactionId)}`;
        EcommerceReportingTransaction response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Users
    #
    # + 'limit - Sets a total of items to return 
    # + offset - Sets a beginning range of items to return 
    # + includeInactive - Include users that are Inactive in results, defaults to TRUE 
    # + includePartners - Include partner users in results, defaults to TRUE 
    # + return - OK 
    remote isolated function listUsers(int? 'limit = (), int? offset = (), boolean? includeInactive = (), boolean? includePartners = ()) returns Users|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "include_inactive": includeInactive, "include_partners": includePartners};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Users response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a User
    #
    # + payload - user 
    # + return - Created 
    remote isolated function createUser(CreateUser payload) returns RestUser|error {
        string resourcePath = string `/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RestUser response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get User email signature
    #
    # + userId - userId 
    # + return - OK 
    remote isolated function getUserSignature(int userId) returns string|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/signature`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
}
