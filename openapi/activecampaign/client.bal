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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Provide your API Key as Api-Token. Eg: {apiToken : <Your API Key>} Your API key can be found in your account on the Settings page under the Developer tab.
    string apiToken;
|};

# This is a generated connector for [ActiveCampaign API version 3](https://developers.activecampaign.com/reference/overview) OpenAPI specification.  ActiveCampaignis an integrated email marketing, automation, sales software, and CRM platform. It lets users perform powerful automation, email marketing, and customer relationship management. 
@display {label: "ActiveCampaign", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [ActiveCampaign account](https://www.activecampaign.com) and obtain tokens by following [this guide](https://developers.activecampaign.com/reference/authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieve an account
    #
    # + id - Account's ID 
    # + return - Account data 
    remote isolated function retrieveAccount(string id) returns AccountData|error {
        string resourcePath = string `/api/3/accounts/${getEncodedUri(id)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountData response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an account
    #
    # + id - Account's ID 
    # + payload - Update account payload 
    # + return - Account data 
    remote isolated function updateAccount(string id, UpdateAccountRequest payload) returns AccountData|error {
        string resourcePath = string `/api/3/accounts/${getEncodedUri(id)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete an account
    #
    # + id - Account's ID 
    # + return - Deletion response 
    remote isolated function deleteAccount(string id) returns http:Response|error {
        string resourcePath = string `/api/3/accounts/${getEncodedUri(id)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List all accounts
    #
    # + search - Search by name 
    # + countDeals - Whether to compute the contactCount and dealCount counts for the number of contacts/deals associated with each account. Set it to true to include the right counts. If set to false or omitted from the call, then contactCount and dealCount will not be counted and be simply displayed as 0. 
    # + return - Accounts 
    remote isolated function listAccounts(string? search = (), string? countDeals = ()) returns AccountListResponse|error {
        string resourcePath = string `/api/3/accounts`;
        map<anydata> queryParam = {"search": search, "count_deals": countDeals};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an account
    #
    # + payload - Create account payload 
    # + return - Account data 
    remote isolated function createAccount(CreateAccountRequest payload) returns AccountData|error {
        string resourcePath = string `/api/3/accounts`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountData response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a new note for an account
    #
    # + id - Account's id to assign new note to 
    # + payload - Create Account Note payload 
    # + return - Account Note data 
    remote isolated function createAccountNote(string id, CreateAccountNoteRequest payload) returns AccountNoteData|error {
        string resourcePath = string `/api/3/accounts/${getEncodedUri(id)}/notes`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountNoteData response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Update an account note
    #
    # + id - Account's id to assign new note to 
    # + noteId - Account note's id to update 
    # + payload - Update Account Note payload 
    # + return - Account Note data 
    remote isolated function updateAccoutNote(string id, string noteId, UpdateAccountNoteRequest payload) returns AccountNoteData|error {
        string resourcePath = string `/api/3/accounts/${getEncodedUri(id)}/notes/${getEncodedUri(noteId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountNoteData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List, search, and filter contacts
    #
    # + ids - Filter contacts by ID. Can be repeated for multiple IDs. 
    # + email - Filter contacts by ID. Can be repeated for multiple IDs. 
    # + emailLike - Filter contacts that contain the given value in the email address 
    # + exclude - Exclude from the response the contact with the given ID 
    # + formid - Filter contacts associated with the given form 
    # + idGreater - Only include contacts with an ID greater than the given ID 
    # + idLess - Only include contacts with an ID less than the given ID 
    # + listid - Filter contacts associated with the given list 
    # + search - Filter contacts that match the given value in the contact names, organization, phone or email 
    # + segmentid - Return only contacts that match a list segment (this param initially returns segment information, when it is run a second time it will return contacts that match the segment) 
    # + seriesid - Filter contacts associated with the given automation 
    # + status - Status 
    # + tagid - Filter contacts associated with the given tag 
    # + filtersCreatedBefore - Filter contacts that were created prior to this date 
    # + filtersCreatedAfter - Filter contacts that were created after this date 
    # + filtersUpdatedBefore - Filter contacts that were updated before this date 
    # + filtersUpdatedAfter - Filter contacts that were updated after this date 
    # + waitid - Filter by contacts in the wait queue of an automation block 
    # + ordersCdate - Order contacts by creation date 
    # + ordersEmail - Order contacts by email 
    # + ordersFirstName - Order contacts by first name 
    # + ordersLastName - Order contacts by last name 
    # + ordersName - Order contacts by full name 
    # + fordersScore - Order contacts by score 
    # + inGroupLists - Set this to "true" in order to return only contacts that the current user has permissions to see. 
    # + return - Contacts 
    remote isolated function getContacts(string? ids = (), string? email = (), string? emailLike = (), int? exclude = (), int? formid = (), int? idGreater = (), int? idLess = (), string? listid = (), string? search = (), int? segmentid = (), int? seriesid = (), int? status = (), int? tagid = (), string? filtersCreatedBefore = (), string? filtersCreatedAfter = (), string? filtersUpdatedBefore = (), string? filtersUpdatedAfter = (), int? waitid = (), string? ordersCdate = (), string? ordersEmail = (), string? ordersFirstName = (), string? ordersLastName = (), string? ordersName = (), string? fordersScore = (), string? inGroupLists = ()) returns ContactListResponse|error {
        string resourcePath = string `/api/3/contacts`;
        map<anydata> queryParam = {"ids": ids, "email": email, "email_like": emailLike, "exclude": exclude, "formid": formid, "id_greater": idGreater, "id_less": idLess, "listid": listid, "search": search, "segmentid": segmentid, "seriesid": seriesid, "status": status, "tagid": tagid, "filters[created_before]": filtersCreatedBefore, "filters[created_after]": filtersCreatedAfter, "filters[updated_before]": filtersUpdatedBefore, "filters[updated_after]": filtersUpdatedAfter, "waitid": waitid, "orders[cdate]": ordersCdate, "orders[email]": ordersEmail, "orders[first_name]": ordersFirstName, "orders[last_name]": ordersLastName, "orders[name]": ordersName, "forders[score]": fordersScore, "in_group_lists": inGroupLists};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Contact
    #
    # + payload - Create Contact payload 
    # + return - Contact data 
    remote isolated function createContact(CreateContactRequest payload) returns ContactReadResponse|error {
        string resourcePath = string `/api/3/contacts`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactReadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve an existing contact
    #
    # + contactId - ID of the contact 
    # + return - Contact data 
    remote isolated function getContactById(string contactId) returns ContactReadResponse|error {
        string resourcePath = string `/api/3/contacts/${getEncodedUri(contactId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactReadResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Contact
    #
    # + contactId - Delete an existing contact 
    # + return - No content 
    remote isolated function deleteContact(int contactId) returns http:Response|error {
        string resourcePath = string `/api/3/contacts/${getEncodedUri(contactId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve a contact's data
    #
    # + contactId - ID of the contact 
    # + return - Contact data 
    remote isolated function getContactData(int contactId) returns ContactDataResponse|error {
        string resourcePath = string `/api/3/contacts/${getEncodedUri(contactId)}/contactData`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactDataResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Contact Bounce Logs
    #
    # + contactId - ID of the contact 
    # + return - Bounce Log data 
    remote isolated function getContactBounceLogs(int contactId) returns BounceLogResponse|error {
        string resourcePath = string `/api/3/contacts/${getEncodedUri(contactId)}/bounceLogs`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BounceLogResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a contact's goals
    #
    # + contactId - ID of the contact 
    # + return - Contact Goals data 
    remote isolated function getContactDataGoals(int contactId) returns ContactGoalResponse|error {
        string resourcePath = string `/api/3/contacts/${getEncodedUri(contactId)}/contactGoals`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactGoalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all automations a contact is in
    #
    # + return - Contact Automations 
    remote isolated function listContactAutomations() returns ContactAutomationListResponse|error {
        string resourcePath = string `/api/3/contactAutomations`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactAutomationListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add a contact to an automation
    #
    # + payload - Add Contact to Automation payload 
    # + return - Contact Automation data 
    remote isolated function addContactToAutomation(AddContactAutomationRequest payload) returns ContactAutomationResponse|error {
        string resourcePath = string `/api/3/contactAutomations`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactAutomationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve an automation a contact is in
    #
    # + contactAutomationId - ID of the contactAutomation to retrieve 
    # + return - Contact Automation data 
    remote isolated function getContactAutomation(int contactAutomationId) returns ContactAutomationResponse|error {
        string resourcePath = string `/api/3/contactAutomations/${getEncodedUri(contactAutomationId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ContactAutomationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove a contact from an automation
    #
    # + contactAutomationId - ID of the contactAutomation to delete 
    # + return - No content 
    remote isolated function deleteContactAutomation(int contactAutomationId) returns http:Response|error {
        string resourcePath = string `/api/3/contactAutomations/${getEncodedUri(contactAutomationId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List all email activities
    #
    # + filtersSubscriberid - Set this parameter to return only email activities belonging to a given subscriber. 
    # + filtersDealid - Set this parameter to return only email activities belonging to a given deal. 
    # + return - Email Activities 
    remote isolated function listEmailActivities(int filtersSubscriberid, int filtersDealid) returns json|error {
        string resourcePath = string `/api/3/cemailActivities`;
        map<anydata> queryParam = {"filters[subscriberid]": filtersSubscriberid, "filters[dealId]": filtersDealid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or update a contact
    #
    # + payload - Update Contact payload 
    # + return - Contact data 
    remote isolated function createOrUpdateContact(UpdateContactRequest payload) returns ContactReadResponse|error {
        string resourcePath = string `/api/3/contact/sync`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactReadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Subscribe a contact to a list or unsubscribe a contact from a list.
    #
    # + payload - Subscribe or Unsubscribe from list payload 
    # + return - List subscription data 
    remote isolated function subscribeOrUnsubscribeContactFromList(SubscribeOrUnsubscribeContactRequest payload) returns SubscribeOrUnsubscribeContactResponse|error {
        string resourcePath = string `/api/3/contactLists`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscribeOrUnsubscribeContactResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Bulk import status list. After using the POST endpoint to send bulk data, you can use this endpoint to monitor progress.
    #
    # + return - BulkImport status response 
    remote isolated function bulkImportStatusList() returns BulkImportStatus|error {
        string resourcePath = string `/api/3/import/bulk_import`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BulkImportStatus response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Bulk import contacts
    #
    # + payload - Bulk import payload 
    # + return - Bulk import data 
    remote isolated function bulkImportContacts(BulkImportRequest payload) returns BulkImportResponse|error {
        string resourcePath = string `/api/3/import/bulk_import`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkImportResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # This endpoint returns a specific bulk import's status including the contact IDs of any newly created contacts, and emails of any contacts that failed to be created.
    #
    # + batchId - Batch ID 
    # + return - BulkImport status list 
    remote isolated function bulkImportStatusInfo(string batchId) returns BulkImportStatusInfo|error {
        string resourcePath = string `/api/3/import/info`;
        map<anydata> queryParam = {"batchId": batchId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BulkImportStatusInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all campaigns
    #
    # + ordersSdate - Order campaigns by send date 
    # + ordersLdate - Order campaigns by last send date 
    # + filtersAutomation - Filter to return automation campaigns 
    # + return - Campaigns 
    remote isolated function getCampaigns(string? ordersSdate = (), string? ordersLdate = (), string? filtersAutomation = ()) returns CampaignListResponse|error {
        string resourcePath = string `/api/3/campaigns`;
        map<anydata> queryParam = {"orders[sdate]": ordersSdate, "orders[ldate]": ordersLdate, "filters[automation]": filtersAutomation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CampaignListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a campaign
    #
    # + campaignId - ID of campaign to retrieve 
    # + return - Campaign data 
    remote isolated function getCampaignById(int campaignId) returns CampaignReadResponse|error {
        string resourcePath = string `/api/3/campaigns/${getEncodedUri(campaignId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CampaignReadResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all messages
    #
    # + return - Message List 
    remote isolated function getMessages() returns MessageListResponse|error {
        string resourcePath = string `/api/3/messages`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add a tag to a contact
    #
    # + payload - Contact tag data payload 
    # + return - Contact Tag data 
    remote isolated function addTagToContact(AddTagToContactRequest payload) returns ContactTagReadResponse|error {
        string resourcePath = string `/api/3/contactTags`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactTagReadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove a tag from a contact
    #
    # + tagId - The contactTag id 
    # + return - No Content 
    remote isolated function removeTagFromContact(string tagId) returns http:Response|error {
        string resourcePath = string `/api/3/contactTags/${getEncodedUri(tagId)}`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all lists
    #
    # + filtersName - Filter by the name of the list 
    # + return - Lists 
    remote isolated function getLists(string? filtersName = ()) returns ListListResponse|error {
        string resourcePath = string `/api/3/lists`;
        map<anydata> queryParam = {"filters[name]": filtersName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a list
    #
    # + payload - Create List payload 
    # + return - List 
    remote isolated function createList(CreateListRequest payload) returns ListCreateResponse|error {
        string resourcePath = string `/api/3/lists`;
        map<any> headerValues = {"Api-Token": self.apiKeyConfig.apiToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListCreateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
