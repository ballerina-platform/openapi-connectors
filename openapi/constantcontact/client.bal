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

# This is a generated connector for [Constant Contact API v3](https://v3.developer.constantcontact.com/api_guide/index.html) OpenAPI specification.
# The Constant Contact, Inc. V3 public API, for building integrations with Constant Contact, the leading small-business email marketing platform.
@display {label: "Constantcontact", iconPath: "resources/constantcontact.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Constant Contact account](https://v3.developer.constantcontact.com/login/index.html) and obtain tokens by following [this guide](https://v3.developer.constantcontact.com/api_guide/getting_started.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.cc.email/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # GET User Privileges
    #
    # + return - Request successful.
    remote isolated function getUserPrivileges() returns UserPrivilegesResource|error {
        string  path = string `/account/user/privileges`;
        UserPrivilegesResource response = check self.clientEp-> get(path, targetType = UserPrivilegesResource);
        return response;
    }
    # GET a Summary of Account Details
    #
    # + extraFields - Use the `extra_fields` query parameter to include the `physical_address` and/or `company_logo` details in the response body. Use a comma separated list to include both (physical_address, company logo).
    # + return - Request successful
    remote isolated function getAccountById(string? extraFields = ()) returns Customer|error {
        string  path = string `/account/summary`;
        map<anydata> queryParam = {"extra_fields": extraFields};
        path = path + check getPathForQueryParam(queryParam);
        Customer response = check self.clientEp-> get(path, targetType = Customer);
        return response;
    }
    # PUT (update) Account Details
    #
    # + payload - In the request body, specify changes to account details by including and modifying all or select `CustomerPut` properties. Changes to read-only fields (`encoded_account_id`) are ignored.
    # + return - Request successful
    remote isolated function putCustomerById(CustomerPut payload) returns CustomerPut|error {
        string  path = string `/account/summary`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomerPut response = check self.clientEp->put(path, request, targetType=CustomerPut);
        return response;
    }
    # GET the Physical Address for the Account
    #
    # + return - Request successful
    remote isolated function getPhysicalAddress() returns AccountPhysicalAddress|error {
        string  path = string `/account/summary/physical_address`;
        AccountPhysicalAddress response = check self.clientEp-> get(path, targetType = AccountPhysicalAddress);
        return response;
    }
    # PUT (update) the Physical Address for an Account
    #
    # + payload - Include all `AccountPhysicalAddress` properties required for the specified `country_code` and then update only those properties that you want to change. Excluding a non-read only field from the request body removes it from the physical address.
    # + return - Request successful
    remote isolated function putPhysicalAddress(AccountPhysicalAddress payload) returns AccountPhysicalAddress|error {
        string  path = string `/account/summary/physical_address`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountPhysicalAddress response = check self.clientEp->put(path, request, targetType=AccountPhysicalAddress);
        return response;
    }
    # GET a Collection of Account Email Addresses
    #
    # + confirmStatus - Use the `confirm_status` query parameter to search for account emails using the email status. Possible values are `CONFIRMED` or `UNCONFIRMED`. You can also abbreviate the values of this query parameter and use `C` or `U`.
    # + roleCode - Use the `role_code` query parameter to search for account emails that have a specific role. Each each email address in an account can have multiple roles or no role. Possible values are `CONTACT`, `BILLING`, `REPLY_TO`, `JOURNALING`, or `OTHER`. You can also abbreviate the value of this query parameter and use `C`,`B`,`R`,`J`, or `O`.
    # + emailAddress - Use the `email_address` query parameter to search for a specific account email address.
    # + return - Request successful.
    remote isolated function retrieveEmailAddresses(string? confirmStatus = (), string? roleCode = (), string? emailAddress = ()) returns AccountEmails|error {
        string  path = string `/account/emails`;
        map<anydata> queryParam = {"confirm_status": confirmStatus, "role_code": roleCode, "email_address": emailAddress};
        path = path + check getPathForQueryParam(queryParam);
        AccountEmails response = check self.clientEp-> get(path, targetType = AccountEmails);
        return response;
    }
    # POST Add an Account Email Address
    #
    # + payload - A JSON request payload containing the new email address you want to add to the Constant Contact account.
    # + return - Request successful.
    remote isolated function addAccountEmailAddress(AccountEmailInput payload) returns AccountEmailCreateResponse|error {
        string  path = string `/account/emails`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountEmailCreateResponse response = check self.clientEp->post(path, request, targetType=AccountEmailCreateResponse);
        return response;
    }
    # GET Activity Status Collection
    #
    # + 'limit - Specifies the number of results displayed per page of output, from 1 - 500, default = 50.
    # + state - Use this parameter to filter the response to include only activities in one of the following states: cancelled, completed, failed, processing, or timed_out.
    # + return - Request Successful
    remote isolated function getActivityStatusCollection(int 'limit = 50, string? state = ()) returns Activities|error {
        string  path = string `/activities`;
        map<anydata> queryParam = {"limit": 'limit, "state": state};
        path = path + check getPathForQueryParam(queryParam);
        Activities response = check self.clientEp-> get(path, targetType = Activities);
        return response;
    }
    # GET an Activity Status
    #
    # + activityId - The unique ID of the activity to GET
    # + return - Request Successful
    remote isolated function getActivity(string activityId) returns Activity|error {
        string  path = string `/activities/${activityId}`;
        Activity response = check self.clientEp-> get(path, targetType = Activity);
        return response;
    }
    # Export Contacts to a File
    #
    # + payload - A JSON payload that specifies the contacts (rows in the CSV file) and contact properties (columns in the CSV file) you want to export.
    # + return - Request successful, queued for processing.
    remote isolated function postContactsExport(ContactsExport payload) returns ActivityExportStatus|error {
        string  path = string `/activities/contact_exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityExportStatus response = check self.clientEp->post(path, request, targetType=ActivityExportStatus);
        return response;
    }
    # Delete Contacts in Bulk
    #
    # + payload - The request body contains an array of contact_ids <em>or</em> list_ids. All contact_ids provided are deleted, or all members of each specified list_id are deleted.
    # + return - Request successful. Activity queued for processing.
    remote isolated function postContactDelete(ContactDelete payload) returns ActivityDeleteStatus|error {
        string  path = string `/activities/contact_delete`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityDeleteStatus response = check self.clientEp->post(path, request, targetType=ActivityDeleteStatus);
        return response;
    }
    # Import Contacts using a CSV File
    #
    # + payload - ContactsCSVImport request
    # + return - Request successful. Activity queued for processing.
    remote isolated function contactsCSVImport(Body payload) returns ActivityImport|error {
        string  path = string `/activities/contacts_file_import`;
        http:Request request = new;
        ActivityImport response = check self.clientEp->post(path, request, targetType=ActivityImport);
        return response;
    }
    # Import Contacts using a JSON Payload
    #
    # + payload - The JSON request payload that contains the contact data and contact lists for the import.
    # + return - Request successful. Activity queued for processing.
    remote isolated function bulkImportContactsJSON(ContactsJsonImport payload) returns ActivityImport|error {
        string  path = string `/activities/contacts_json_import`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityImport response = check self.clientEp->post(path, request, targetType=ActivityImport);
        return response;
    }
    # Remove Contacts from Lists
    #
    # + payload - The JSON payload used to create the 'remove contacts from lists' activity
    # + return - Request successful. Activity queued for processing.
    remote isolated function postListRemoveContact(ListActivityRemoveContacts payload) returns ActivityListsMembership|error {
        string  path = string `/activities/remove_list_memberships`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityListsMembership response = check self.clientEp->post(path, request, targetType=ActivityListsMembership);
        return response;
    }
    # Add Contacts to Lists
    #
    # + payload - The JSON payload used to create the 'add contacts to lists' activity
    # + return - Request successful. Activity queued for processing.
    remote isolated function postListAddContact(ListActivityAddContacts payload) returns ActivityListsMembership|error {
        string  path = string `/activities/add_list_memberships`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityListsMembership response = check self.clientEp->post(path, request, targetType=ActivityListsMembership);
        return response;
    }
    # Remove Tags from Contacts
    #
    # + payload - The JSON payload used to create an asynchronous activity that removes tags from contacts meeting your specified contact filtering criteria.
    # + return - Request successful. Activity queued for processing.
    remote isolated function postTagRemoveContact(TagAddRemoveContacts payload) returns ActivityTagging|error {
        string  path = string `/activities/contacts_taggings_remove`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityTagging response = check self.clientEp->post(path, request, targetType=ActivityTagging);
        return response;
    }
    # Add Tags to Contacts
    #
    # + payload - The JSON payload used to create an asynchronous activity that adds tags to contacts that meet your specified contact filtering criteria.
    # + return - Request successful. Activity queued for processing.
    remote isolated function postTagAddContact(TagAddRemoveContacts payload) returns ActivityTagging|error {
        string  path = string `/activities/contacts_taggings_add`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityTagging response = check self.clientEp->post(path, request, targetType=ActivityTagging);
        return response;
    }
    # Delete Tags
    #
    # + payload - An array of string values (`tag_id`s) to delete.
    # + return - Request successful. Activity queued for processing.
    remote isolated function postTagDelete(TagIdList500Limit payload) returns ActivityTagging|error {
        string  path = string `/activities/contacts_tags_delete`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActivityTagging response = check self.clientEp->post(path, request, targetType=ActivityTagging);
        return response;
    }
    # GET all Segments
    #
    # + 'limit - The number of segments to return on a page.
    # + sortBy - Specify the segment sort order to use. Sort by name (`sort_by=name`) in ascending order, or sort by date (`sort_by=date`) in descending order with the most recently updated segments listed first.
    # + return - Request successful.
    remote isolated function getAccountSegments(string 'limit = "1000", string sortBy = "date") returns SegmentsDTO|error {
        string  path = string `/segments`;
        map<anydata> queryParam = {"limit": 'limit, "sort_by": sortBy};
        path = path + check getPathForQueryParam(queryParam);
        SegmentsDTO response = check self.clientEp-> get(path, targetType = SegmentsDTO);
        return response;
    }
    # POST (create) a Segment
    #
    # + payload - The segment `name` and `segment_criteria` (requires single-string escaped JSON).
    # + return - Segment successfully created.
    remote isolated function createSegment(SegmentData payload) returns SegmentDetail|error {
        string  path = string `/segments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SegmentDetail response = check self.clientEp->post(path, request, targetType=SegmentDetail);
        return response;
    }
    # GET a Segment's Details
    #
    # + segmentId - The system-generated unique ID that identifies a segment.
    # + return - The segment was successfully returned.
    remote isolated function getSegmentDetail(int segmentId) returns SegmentDetail|error {
        string  path = string `/segments/${segmentId}`;
        SegmentDetail response = check self.clientEp-> get(path, targetType = SegmentDetail);
        return response;
    }
    # PUT (update) a Segment
    #
    # + segmentId - The system generated ID that uniquely identifies the segment that you want to modify.
    # + payload - Include both the `name` and `segment_criteria` (single-string escaped JSON) in the body request, then make updates to either or both.
    # + return - The segment was successfully updated.
    remote isolated function updateSegment(int segmentId, SegmentData payload) returns SegmentDetail|error {
        string  path = string `/segments/${segmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SegmentDetail response = check self.clientEp->put(path, request, targetType=SegmentDetail);
        return response;
    }
    # DELETE a Segment
    #
    # + segmentId - The system generated ID that uniquely identifies the segment.
    # + return - The segment was successfully deleted.
    remote isolated function deleteSegment(int segmentId) returns http:Response|error {
        string  path = string `/segments/${segmentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # PATCH (rename) a Segment
    #
    # + segmentId - The system generated ID that uniquely identifies the segment that you want to modify.
    # + payload - Include the existing segment `name` in the body request, then rename the segment using a unique new name.
    # + return - The segment name was successfully updated.
    remote isolated function updateSegmentName(int segmentId, SegmentName payload) returns SegmentDetail|error {
        string  path = string `/segments/${segmentId}/name`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SegmentDetail response = check self.clientEp->patch(path, request, targetType=SegmentDetail);
        return response;
    }
    # GET a Contact
    #
    # + contactId - Unique ID of contact to GET
    # + include - Use `include` to specify which contact sub-resources to include in the response. Use a comma to separate multiple sub-resources. Valid values: `custom_fields`, `list_memberships`, `phone_numbers`, `street_addresses`, `notes`, and `taggings`.
    # + return - Request successful
    remote isolated function getContact(string contactId, string? include = ()) returns ContactResource|error {
        string  path = string `/contacts/${contactId}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        ContactResource response = check self.clientEp-> get(path, targetType = ContactResource);
        return response;
    }
    # PUT (update) a Contact
    #
    # + contactId - Unique ID of contact to update
    # + payload - JSON payload defining the contact object, with updates. Any properties left blank or not included in the PUT payload are overwritten with null value - does not apply to contact subresources.
    # + return - Contact resource has been updated
    remote isolated function putContact(string contactId, ContactPutRequest payload) returns ContactResource|error {
        string  path = string `/contacts/${contactId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactResource response = check self.clientEp->put(path, request, targetType=ContactResource);
        return response;
    }
    # DELETE a Contact
    #
    # + contactId - Unique ID of contact to DELETE
    # + return - Request successful; No content returned
    remote isolated function deleteContact(string contactId) returns http:Response|error {
        string  path = string `/contacts/${contactId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # GET Contacts Collection
    #
    # + status - Use the `status` query parameter to search for contacts by status. This parameter accepts one or more comma separated values: `all`, `active`, `deleted`, `not_set`, `pending_confirmation`, `temp_hold`, and `unsubscribed`.
    # + email - Use the `email` query parameter to search for a contact using a specific email address.
    # + lists - Use the `lists` query parameter to search for contacts that are members of one or more specified lists. Use a comma to separate multiple `list_id` values, up to a maximum of 25.
    # + segmentId - Use to get contacts that meet the segment criteria for a single specified `segment_id`. This query parameter can only be combined with the limit query parameter. When using the `segment_id` query parameter, the V3 API may return a 202 response code instead of a 200 response. The 202 response code indicates that your request has been accepted, but not fully completed. Retry sending your API request to return the completed results and a 200 response code.
    # + tags - Use to get contact details for up to 50 specified tags. Use a comma to separate each `tag_id`.
    # + updatedAfter - Use `updated_after` to search for contacts that have been updated after the date you specify; accepts ISO-8601 formatted dates.
    # + include - Use `include` to specify which contact sub-resources to include in the response. Use a comma to separate multiple sub-resources. Valid values: `custom_fields`, `list_memberships`, `taggings`, `notes`,`phone_numbers`, `street_addresses`. 
    # + includeCount - Set `include_count=true` to include the total number of contacts (`contacts_count`) that meet all search criteria in the response body.
    # + 'limit - Specifies the number of results displayed per page of output in the response, from 1 - 500, default = 50.
    # + return - Request successful
    remote isolated function getContacts(string? status = (), string? email = (), string? lists = (), string? segmentId = (), string? tags = (), string? updatedAfter = (), string? include = (), boolean? includeCount = (), int 'limit = 50) returns Contacts|error {
        string  path = string `/contacts`;
        map<anydata> queryParam = {"status": status, "email": email, "lists": lists, "segment_id": segmentId, "tags": tags, "updated_after": updatedAfter, "include": include, "include_count": includeCount, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp-> get(path, targetType = Contacts);
        return response;
    }
    # POST (create) a Contact
    #
    # + payload - The JSON payload defining the contact
    # + return - New contact successfully created
    remote isolated function createContact(ContactPostRequest payload) returns ContactResource|error {
        string  path = string `/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactResource response = check self.clientEp->post(path, request, targetType=ContactResource);
        return response;
    }
    # Create or Update a Contact
    #
    # + payload - A JSON request body payload that contains the contact resource you are creating or updating. The request body must contain the `email_address` property and the `list_memberships` array.
    # + return - Contact successfully updated.
    remote isolated function createOrUpdateContact(ContactCreateOrUpdateInput payload) returns ContactCreateOrUpdateResponse|error {
        string  path = string `/contacts/sign_up_form`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactCreateOrUpdateResponse response = check self.clientEp->post(path, request, targetType=ContactCreateOrUpdateResponse);
        return response;
    }
    # GET a collection of V2 and V3 API contact IDs
    #
    # + sequenceIds - Comma delimited list of V2 API contact `ids` to cross-reference with the V3 API `contact_id` value. Endpoint accepts a maximum of 500 ids at a time.
    # + return - Request successful
    remote isolated function getContactIdXrefs(string sequenceIds) returns ContactXrefs|error {
        string  path = string `/contacts/contact_id_xrefs`;
        map<anydata> queryParam = {"sequence_ids": sequenceIds};
        path = path + check getPathForQueryParam(queryParam);
        ContactXrefs response = check self.clientEp-> get(path, targetType = ContactXrefs);
        return response;
    }
    # GET a custom_field
    #
    # + customFieldId - Unique ID of the `custom_field` on which to operate.
    # + return - Request successful
    remote isolated function getCustomField(string customFieldId) returns CustomFieldResource|error {
        string  path = string `/contact_custom_fields/${customFieldId}`;
        CustomFieldResource response = check self.clientEp-> get(path, targetType = CustomFieldResource);
        return response;
    }
    # PUT (update) a custom_field
    #
    # + customFieldId - Unique ID of the `custom_field` on which to operate.
    # + payload - The JSON payload used to update an existing custom field. Any properties omitted in the PUT request are overwritten with a null value.
    # + return - Success - custom_field updated
    remote isolated function putCustomField(string customFieldId, CustomFieldInput payload) returns CustomFieldResource|error {
        string  path = string `/contact_custom_fields/${customFieldId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomFieldResource response = check self.clientEp->put(path, request, targetType=CustomFieldResource);
        return response;
    }
    # DELETE a custom_field
    #
    # + customFieldId - Unique ID of the custom_field on which to operate.
    # + return - Request successful; No content returned
    remote isolated function deleteCustomField(string customFieldId) returns http:Response|error {
        string  path = string `/contact_custom_fields/${customFieldId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # GET custom_fields Collection
    #
    # + 'limit - Specifies the number of results displayed per page of output, from 1 - 100, default = 50.
    # + return - Request successful
    remote isolated function getCustomFields(int 'limit = 50) returns CustomFields|error {
        string  path = string `/contact_custom_fields`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CustomFields response = check self.clientEp-> get(path, targetType = CustomFields);
        return response;
    }
    # POST (create) a custom_field
    #
    # + payload - The JSON payload required to create a new `custom_field`
    # + return - New custom_field successfully created
    remote isolated function postCustomFields(CustomFieldInput payload) returns CustomFieldResource|error {
        string  path = string `/contact_custom_fields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomFieldResource response = check self.clientEp->post(path, request, targetType=CustomFieldResource);
        return response;
    }
    # GET a List
    #
    # + listId - The system generated ID that uniquely identifies a contact list.
    # + includeMembershipCount - Use to include the number of contact members per list by setting the `include_membership_count` to either `active`, to count only active contacts, or `all` to include all contacts in the count.
    # + return - Request successful
    remote isolated function getList(string listId, string? includeMembershipCount = ()) returns ContactList|error {
        string  path = string `/contact_lists/${listId}`;
        map<anydata> queryParam = {"include_membership_count": includeMembershipCount};
        path = path + check getPathForQueryParam(queryParam);
        ContactList response = check self.clientEp-> get(path, targetType = ContactList);
        return response;
    }
    # PUT (update) a List
    #
    # + listId - Unique ID of the contact list to update
    # + payload - JSON payload containing updates to the specified contact list
    # + return - Request successful
    remote isolated function putList(string listId, ListInput payload) returns ContactList|error {
        string  path = string `/contact_lists/${listId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactList response = check self.clientEp->put(path, request, targetType=ContactList);
        return response;
    }
    # DELETE a List
    #
    # + listId - Unique ID of the list to delete
    # + return - Accepted
    remote isolated function deleteListActivity(string listId) returns ActivityDeleteListResponse|error {
        string  path = string `/contact_lists/${listId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ActivityDeleteListResponse response = check self.clientEp-> delete(path, request, targetType = ActivityDeleteListResponse);
        return response;
    }
    # GET Lists Collection
    #
    # + 'limit - Use to specify the number of results displayed per page of output, from 1 - 500, default = 50.
    # + includeCount - Set `include_count` to `true` to return the total number of contact lists that meet your selection criteria.
    # + includeMembershipCount - Use to include the number of contact members per list by setting the `include_membership_count` to either `active`, to count only active contacts, or `all` to include all contacts in the count.
    # + return - Request successful
    remote isolated function getLists(int 'limit = 50, boolean includeCount = false, string? includeMembershipCount = ()) returns ContactListArray|error {
        string  path = string `/contact_lists`;
        map<anydata> queryParam = {"limit": 'limit, "include_count": includeCount, "include_membership_count": includeMembershipCount};
        path = path + check getPathForQueryParam(queryParam);
        ContactListArray response = check self.clientEp-> get(path, targetType = ContactListArray);
        return response;
    }
    # POST (create) a List
    #
    # + payload - JSON payload defining the new contact list
    # + return - New list successfully created
    remote isolated function createList(ListInput payload) returns ContactList|error {
        string  path = string `/contact_lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ContactList response = check self.clientEp->post(path, request, targetType=ContactList);
        return response;
    }
    # GET a collection of V2 and V3 API List IDs
    #
    # + sequenceIds - Comma delimited list of V2 API list `ids` to cross-reference with the V3 API `list_id` value. Endpoint accepts a maximum of 500 ids at a time.
    # + return - Request successful
    remote isolated function getListIdXrefs(string sequenceIds) returns ListXrefs|error {
        string  path = string `/contact_lists/list_id_xrefs`;
        map<anydata> queryParam = {"sequence_ids": sequenceIds};
        path = path + check getPathForQueryParam(queryParam);
        ListXrefs response = check self.clientEp-> get(path, targetType = ListXrefs);
        return response;
    }
    # GET Tag Details
    #
    # + tagId - The ID that uniquely identifies a tag (UUID format).
    # + includeCount - Use to include (`true`) or exclude (`false`) the total number of tagged contacts (`contacts_count`) from the results.
    # + return - Request Successful
    remote isolated function getTag(string tagId, boolean includeCount = false) returns Tag|error {
        string  path = string `/contact_tags/${tagId}`;
        map<anydata> queryParam = {"include_count": includeCount};
        path = path + check getPathForQueryParam(queryParam);
        Tag response = check self.clientEp-> get(path, targetType = Tag);
        return response;
    }
    # PUT (Update) a Tag
    #
    # + tagId - The system generated ID used to uniquely identify the tag that you want to rename (UUID format).
    # + payload - The JSON payload used to update the tag name (`name`).
    # + return - Request Successful
    remote isolated function putTag(string tagId, TagPut payload) returns Tag|error {
        string  path = string `/contact_tags/${tagId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Tag response = check self.clientEp->put(path, request, targetType=Tag);
        return response;
    }
    # DELETE a Tag
    #
    # + tagId - The ID that uniquely identifies a tag in UUID format.
    # + return - The asynchronous request was successfully accepted. To view the results of the activity request, use the href link returned in the response.
    remote isolated function deleteTag(string tagId) returns ActivityGeneric|error {
        string  path = string `/contact_tags/${tagId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ActivityGeneric response = check self.clientEp-> delete(path, request, targetType = ActivityGeneric);
        return response;
    }
    # GET Details for All Tags
    #
    # + 'limit - Use to specify the number of tag results (up to `500`) to display per page of output. The default is `50`.
    # + includeCount - Returns the total number of contacts (`contacts_count`) to which a tag applies.
    # + return - Request Successful
    remote isolated function getTags(int 'limit = 50, boolean includeCount = false) returns Tags|error {
        string  path = string `/contact_tags`;
        map<anydata> queryParam = {"limit": 'limit, "include_count": includeCount};
        path = path + check getPathForQueryParam(queryParam);
        Tags response = check self.clientEp-> get(path, targetType = Tags);
        return response;
    }
    # POST (Create) a Tag
    #
    # + payload - The JSON payload to use to create a new tag.
    # + return - Request Successful
    remote isolated function postTag(TagPost payload) returns Tag|error {
        string  path = string `/contact_tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Tag response = check self.clientEp->post(path, request, targetType=Tag);
        return response;
    }
    # GET a Collection of Email Campaigns
    #
    # + 'limit - Specifies the number of campaigns to display on each page of output that is returned (from return 1 - 500). The default returns 50 campaigns per page.
    # + beforeDate - Use to return email campaigns with `updated_at` timestamps that are before a specific date and time (in ISO-8601 format). Use with the `after_date` query parameter to get email campaigns sent within a specific date range.
    # + afterDate - Use to return email campaigns with last `updated_at` timestamps that are after a specific date and time (in ISO-8601 format). Use with the `before_date` query parameter to get email campaigns sent within a specific date range.
    # + return - Request successful.
    remote isolated function retrieveEmailCampaignsUsingGET(int 'limit = 50, string? beforeDate = (), string? afterDate = ()) returns PagedEmailCampaignResponse|error {
        string  path = string `/emails`;
        map<anydata> queryParam = {"limit": 'limit, "before_date": beforeDate, "after_date": afterDate};
        path = path + check getPathForQueryParam(queryParam);
        PagedEmailCampaignResponse response = check self.clientEp-> get(path, targetType = PagedEmailCampaignResponse);
        return response;
    }
    # POST (Create) a New Email Campaign
    #
    # + payload - A JSON request body that contains the email content.
    # + return - Request successful.
    remote isolated function createEmailCampaignUsingPOST(EmailCampaignComplete payload) returns EmailCampaign|error {
        string  path = string `/emails`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmailCampaign response = check self.clientEp->post(path, request, targetType=EmailCampaign);
        return response;
    }
    # GET Details About a Single Email Campaign
    #
    # + campaignId - The ID (UUID format) that uniquely identifies this email campaign.
    # + return - Request successful.
    remote isolated function retrieveEmailCampaignUsingGET(string campaignId) returns EmailCampaign|error {
        string  path = string `/emails/${campaignId}`;
        EmailCampaign response = check self.clientEp-> get(path, targetType = EmailCampaign);
        return response;
    }
    # DELETE an Email Campaign
    #
    # + campaignId - The unique ID for the email campaign you are deleting.
    # + return - Email campaign successfully deleted. No response body returned.
    remote isolated function removeEmailCampaignUsingDELETE(string campaignId) returns http:Response|error {
        string  path = string `/emails/${campaignId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # PATCH (Update) an Email Campaign Name
    #
    # + campaignId - The unique identifier for an email campaign.
    # + payload - A JSON payload that contains the new email campaign name.
    # + return - Request successful.
    remote isolated function renameEmailCampaignUsingPATCH(string campaignId, EmailCampaignName payload) returns EmailCampaign|error {
        string  path = string `/emails/${campaignId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmailCampaign response = check self.clientEp->patch(path, request, targetType=EmailCampaign);
        return response;
    }
    # GET a Collection of V2 and V3 API Email Campaign Identifiers
    #
    # + v2EmailCampaignIds - Comma separated list of V2 API `campaignId` values. You can enter up to 50 V2 `campaignId` values in each request.
    # + return - Request successful.
    remote isolated function retrieveXrefMappingsUsingGET(string v2EmailCampaignIds) returns CrossReferenceResponse|error {
        string  path = string `/emails/campaign_id_xrefs`;
        map<anydata> queryParam = {"v2_email_campaign_ids": v2EmailCampaignIds};
        path = path + check getPathForQueryParam(queryParam);
        CrossReferenceResponse response = check self.clientEp-> get(path, targetType = CrossReferenceResponse);
        return response;
    }
    # GET a Single Email Campaign Activity
    #
    # + campaignActivityId - The unique ID for an email campaign activity.
    # + include - Use the `include` query parameter to enter a comma separated list of additional email campaign activity properties for the V3 API to return. Valid values are `physical_address_in_footer`, `permalink_url`, `html_content`, and `document_properties`.
    # + return - Request successful.
    remote isolated function retrieveEmailCampaignActivityUsingGET(string campaignActivityId, string? include = ()) returns EmailCampaignActivity|error {
        string  path = string `/emails/activities/${campaignActivityId}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        EmailCampaignActivity response = check self.clientEp-> get(path, targetType = EmailCampaignActivity);
        return response;
    }
    # PUT (Update) An Email Campaign Activity
    #
    # + campaignActivityId - The unique ID for the email campaign activity you are updating.
    # + payload - A request body payload that contains the complete email campaign activity with your changes.
    # + return - Email campaign activity successfully updated.
    remote isolated function updateEmailCampaignActivityUsingPUT(string campaignActivityId, EmailCampaignActivity payload) returns EmailCampaignActivity|error {
        string  path = string `/emails/activities/${campaignActivityId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmailCampaignActivity response = check self.clientEp->put(path, request, targetType=EmailCampaignActivity);
        return response;
    }
    # GET an Email Campaign Activity Schedule
    #
    # + campaignActivityId - The unique ID for an email campaign activity.
    # + return - Request successful.
    remote isolated function retrieveEmailSchedulesUsingGET(string campaignActivityId) returns EmailScheduleResponse|error {
        string  path = string `/emails/activities/${campaignActivityId}/schedules`;
        EmailScheduleResponse response = check self.clientEp-> get(path, targetType = EmailScheduleResponse);
        return response;
    }
    # POST (Create) an Email Campaign Activity Schedule
    #
    # + campaignActivityId - The unique ID for an email campaign activity. You can only schedule email campaign activities that have the `primary_email` role.
    # + payload - A request body payload that contains the date that you want Constant Contact to send your email campaign activity on. Use `"0"` as the date to have Constant Contact immediately send the email campaign activity.
    # + return - Request successful.
    remote isolated function scheduleEmailCampaignActivityUsingPOST(string campaignActivityId, EmailScheduleInput payload) returns EmailScheduleResponse|error {
        string  path = string `/emails/activities/${campaignActivityId}/schedules`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmailScheduleResponse response = check self.clientEp->post(path, request, targetType=EmailScheduleResponse);
        return response;
    }
    # DELETE an Email Campaign Activity Schedule
    #
    # + campaignActivityId - The unique ID for an email campaign activity.
    # + return - Email campaign activity schedule successfully deleted. No response body returned.
    remote isolated function unscheduleEmailCampaignActivityUsingDELETE(string campaignActivityId) returns http:Response|error {
        string  path = string `/emails/activities/${campaignActivityId}/schedules`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # POST Test Send an Email Campaign Activity
    #
    # + campaignActivityId - The unique ID for an email campaign activity. You can only test send email campaign activities that have the `primary_email` role.
    # + payload - A JSON request body that contains the recipients of the test email and an optional personal message.
    # + return - Test email campaign activity successfully sent. No response body returned.
    remote isolated function testSendCampaignActivityUsingPOST(string campaignActivityId, EmailTestSendInput payload) returns http:Response|error {
        string  path = string `/emails/activities/${campaignActivityId}/tests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # GET the HTML Preview of an Email Campaign Activity
    #
    # + campaignActivityId - The unique ID for an email campaign activity.
    # + return - Request successful.
    remote isolated function retrieveEmailCampaignActivityPreviewUsingGET(string campaignActivityId) returns EmailCampaignActivityPreview|error {
        string  path = string `/emails/activities/${campaignActivityId}/previews`;
        EmailCampaignActivityPreview response = check self.clientEp-> get(path, targetType = EmailCampaignActivityPreview);
        return response;
    }
    # GET the Send History of an Email Campaign Activity
    #
    # + campaignActivityId - The unique ID for an email campaign activity. You can return the send history for `primary_email` and `resend` role email campaign activities.
    # + return - Request successful.
    remote isolated function retrieveEmailSendHistoryUsingGET(string campaignActivityId) returns EmailSendHistory|error {
        string  path = string `/emails/activities/${campaignActivityId}/send_history`;
        EmailSendHistory response = check self.clientEp-> get(path, targetType = EmailSendHistory);
        return response;
    }
    # GET Contact Activity Details
    #
    # + contactId - The contact id which is requesting tracking activity data.
    # + trackingActivitiesList - The tracking activities list contains the tracking activity types to be specified as part of each request. The tracking activities list is a comma-delimited string containing one ore more tracking activity types. (such as em_sends, em_opens, em_forwards)
    # + 'limit - The number of tracking activities to return in a single page. Valid values are 1 to 100. Default is 100.
    # + return - successful operation
    remote isolated function getContactTracking(string contactId, string trackingActivitiesList, string 'limit = "100") returns ContactTrackingActivitiesPage|error {
        string  path = string `/reports/contact_reports/${contactId}/activity_details`;
        map<anydata> queryParam = {"tracking_activities_list": trackingActivitiesList, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        ContactTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = ContactTrackingActivitiesPage);
        return response;
    }
    # GET Average Open and Click Rates
    #
    # + contactId - The contact id which is requesting tracking activity data (e.g. aa9ff7b0-478d-11e6-8059-00163e3c8e19)
    # + 'start - The starting date, in ISO 8601 format, to use to get campaigns. For example: 2019-01-01T00:00:00-0500.
    # + end - The ending date, in ISO 8601 format, to use to get campaigns. For example: 2019-12-01T00:00:00-0500.
    # + return - Request Successful
    remote isolated function getContactOpenClickRate(string contactId, string 'start, string end) returns ContactOpenAndClickRates|error {
        string  path = string `/reports/contact_reports/${contactId}/open_and_click_rates`;
        map<anydata> queryParam = {"start": 'start, "end": end};
        path = path + check getPathForQueryParam(queryParam);
        ContactOpenAndClickRates response = check self.clientEp-> get(path, targetType = ContactOpenAndClickRates);
        return response;
    }
    # GET Contact Action Summary
    #
    # + contactId - The contact id which is requesting tracking activity data (e.g. aa9ff7b0-478d-11e6-8059-00163e3c8e19)
    # + 'start - The starting date, in ISO 8601 format, to use to get campaigns. For example: 2019-01-01T00:00:00-0500.
    # + end - The ending date, in ISO 8601 format, to use to get campaigns. For example: 2019-12-01T00:00:00-0500.
    # + return - successful operation
    remote isolated function getContactTrackingCount(string contactId, string 'start, string end) returns ContactCampaignActivitiesSummary|error {
        string  path = string `/reports/contact_reports/${contactId}/activity_summary`;
        map<anydata> queryParam = {"start": 'start, "end": end};
        path = path + check getPathForQueryParam(queryParam);
        ContactCampaignActivitiesSummary response = check self.clientEp-> get(path, targetType = ContactCampaignActivitiesSummary);
        return response;
    }
    # GET an Email Links Report
    #
    # + campaignActivityId - The unique ID for an email campaign activity.
    # + return - Request was successful
    remote isolated function getCampaignActivityLinkStats(string campaignActivityId) returns EmailLinks|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/links`;
        EmailLinks response = check self.clientEp-> get(path, targetType = EmailLinks);
        return response;
    }
    # GET an Email Sends Report
    #
    # + campaignActivityId - The unique ID for an email campaign activity to use for this report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getSends(string campaignActivityId, string 'limit = "500") returns SendsTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/sends`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        SendsTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = SendsTrackingActivitiesPage);
        return response;
    }
    # GET an Email Opens Report
    #
    # + campaignActivityId - The unique ID for an email campaign activity to use for this report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getOpens(string campaignActivityId, string 'limit = "500") returns OpensTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/opens`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        OpensTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = OpensTrackingActivitiesPage);
        return response;
    }
    # GET an Email Unique Opens Report
    #
    # + campaignActivityId - The ID that uniquely identifies the email campaign activity to use for this report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getUniqueOpens(string campaignActivityId, string 'limit = "500") returns OpensTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/unique_opens`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        OpensTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = OpensTrackingActivitiesPage);
        return response;
    }
    # GET an Email Did Not Opens Report
    #
    # + campaignActivityId - The ID that uniquely identifies the email campaign activity to use for this report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getDidNotOpens(string campaignActivityId, string 'limit = "500") returns DidNotOpensTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/didnotopens`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        DidNotOpensTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = DidNotOpensTrackingActivitiesPage);
        return response;
    }
    # GET an Email Clicks Report
    #
    # + campaignActivityId - The ID that uniquely identifies the email campaign activity to use for this report.
    # + urlId - The ID that uniquely identifies a single link URL for which you want to get a clicks report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getClicks(string campaignActivityId, int? urlId = (), string 'limit = "500") returns ClicksTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/clicks`;
        map<anydata> queryParam = {"url_id": urlId, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        ClicksTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = ClicksTrackingActivitiesPage);
        return response;
    }
    # GET an Email Forwards Report
    #
    # + campaignActivityId - The ID that uniquely identifies the email campaign activity to use for this report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getForwards(string campaignActivityId, string 'limit = "500") returns ForwardsTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/forwards`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        ForwardsTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = ForwardsTrackingActivitiesPage);
        return response;
    }
    # GET an Email Opt-outs Report
    #
    # + campaignActivityId - The ID that uniquely identifies the email campaign activity to use for this report.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getOptouts(string campaignActivityId, string 'limit = "500") returns OptoutsTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/optouts`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        OptoutsTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = OptoutsTrackingActivitiesPage);
        return response;
    }
    # GET an Email Bounces Report
    #
    # + campaignActivityId - The ID that uniquely identifies the email campaign activity to use for this report.
    # + bounceCode - To return results for a specific bounce code, select the `bounce_code` from the drop-down list. To return results for multiple codes, repeat the bounce code parameter for each. For example, to return results for bounce codes `B` and `D` use `bounce_code=B&bounce_code=D`.
    # + 'limit - The number of tracking activities to return on a page.
    # + return - Request was successful
    remote isolated function getBounces(string campaignActivityId, string[]? bounceCode = (), string 'limit = "500") returns BouncesTrackingActivitiesPage|error {
        string  path = string `/reports/email_reports/${campaignActivityId}/tracking/bounces`;
        map<anydata> queryParam = {"bounce_code": bounceCode, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BouncesTrackingActivitiesPage response = check self.clientEp-> get(path, targetType = BouncesTrackingActivitiesPage);
        return response;
    }
    # GET an Email Campaigns Summary Report
    #
    # + 'limit - Use the `limit` query parameter to limit the number of email campaign summaries to return on a single page. The default is `50` and the maximum is `500` per page.
    # + return - Request was successful.
    remote isolated function getAllBulkEmailCampaignSummaries(string 'limit = "50") returns BulkEmailCampaignSummariesPage|error {
        string  path = string `/reports/summary_reports/email_campaign_summaries`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BulkEmailCampaignSummariesPage response = check self.clientEp-> get(path, targetType = BulkEmailCampaignSummariesPage);
        return response;
    }
    # GET an Email Campaign Stats Report
    #
    # + campaignIds - A comma-separated list of `campaign_id`s (UUID's).
    # + return - Request was successful.
    remote isolated function getEmailSummary(string campaignIds) returns CampaignStatsQueryResultEmail|error {
        string  path = string `/reports/stats/email_campaigns/${campaignIds}`;
        CampaignStatsQueryResultEmail response = check self.clientEp-> get(path, targetType = CampaignStatsQueryResultEmail);
        return response;
    }
    # GET an Email Campaign Activity Stats Report
    #
    # + campaignActivityIds - A comma-separated list of `campaign_activity_id`s (UUID's).
    # + return - Request was successful.
    remote isolated function getEmailCampaignActivitySummary(string campaignActivityIds) returns CampaignActivityStatsQueryResultEmail|error {
        string  path = string `/reports/stats/email_campaign_activities/${campaignActivityIds}`;
        CampaignActivityStatsQueryResultEmail response = check self.clientEp-> get(path, targetType = CampaignActivityStatsQueryResultEmail);
        return response;
    }
    # GET Partner Client Accounts
    #
    # + offset - Depending on the `limit` you specify, the system determines the `offset` parameter to use (number of records to skip) and includes it in the link used to get the next page of results
    # + 'limit - The number of client accounts to return on each page of results. The default value is `50`. Entering a `limit` value less than the minimum (`10`) or greater than the maximum (`50`) is ignored and the system uses the default values. Depending on the `limit` you specify, the system determines the `offset` parameter to use (number of records to skip) and includes it in the link used to get the next page of results.
    # + return - Request successful.
    remote isolated function getPartnerSiteOwners(string? offset = (), string 'limit = "50") returns PartnerAccount|error {
        string  path = string `/partner/accounts`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        PartnerAccount response = check self.clientEp-> get(path, targetType = PartnerAccount);
        return response;
    }
    # POST (create) a Partner Client Account
    #
    # + payload - Create a new Constant Contact client account under your partner account. All required properties must be included in the JSON payload request.
    # + return - Request successful.
    remote isolated function provision(Provision payload) returns ProvisionResponse|error {
        string  path = string `/partner/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProvisionResponse response = check self.clientEp->post(path, request, targetType=ProvisionResponse);
        return response;
    }
    # GET Billing Plan Details for a Client Account
    #
    # + encodedAccountId - Specify the client's unique `encoded_account_id`.
    # + return - Request successful.
    remote isolated function getPlan(string encodedAccountId) returns PlanTiersObject|error {
        string  path = string `/partner/accounts/${encodedAccountId}/plan`;
        PlanTiersObject response = check self.clientEp-> get(path, targetType = PlanTiersObject);
        return response;
    }
    # PUT (update) Billing Plan Details for a Client Account
    #
    # + encodedAccountId - Specify the client's unique `encoded_account_id`.
    # + payload - Update the billing plan (`plan_type`) for an existing Constant Contact client account. Options include:
    # + return - Request successful.
    remote isolated function setPlan(string encodedAccountId, PlanInfo payload) returns PlanTiersObject|error {
        string  path = string `/partner/accounts/${encodedAccountId}/plan`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PlanTiersObject response = check self.clientEp->put(path, request, targetType=PlanTiersObject);
        return response;
    }
    # PUT Cancel the Billing Plan for a Client Account
    #
    # + encodedAccountId - The system generated ID that uniquely identifies the client account.
    # + payload - By default, the current date and time is automatically used as the cancellation date. However, you can specify a future date and time to cancel the account (`effective_date`) in the request body in ISO format. You can also enter the client's cancellation reason (`reason_id`).
    # + return - Request successful
    remote isolated function cancelAccount(string encodedAccountId, AccountCancellation payload) returns AccountCancellation|error {
        string  path = string `/partner/accounts/${encodedAccountId}/status/cancel`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AccountCancellation response = check self.clientEp->put(path, request, targetType=AccountCancellation);
        return response;
    }
    # GET a Collection of Webhook Topic Subscriptions
    #
    # + return - Request successful
    remote isolated function getWebhooksCollection() returns WebhooksSubscriptionCollection|error {
        string  path = string `/partner/webhooks/subscriptions`;
        WebhooksSubscriptionCollection response = check self.clientEp-> get(path, targetType = WebhooksSubscriptionCollection);
        return response;
    }
    # GET Webhook Topic Subscription
    #
    # + topicId - Identifies a webhook topic.
    # + return - Request successful
    remote isolated function getWebhooksTopic(string topicId) returns WebhooksSubscriptionResponse|error {
        string  path = string `/partner/webhooks/subscriptions/${topicId}`;
        WebhooksSubscriptionResponse response = check self.clientEp-> get(path, targetType = WebhooksSubscriptionResponse);
        return response;
    }
    # PUT Webhook Topic Subscription
    #
    # + topicId - Identifies a webhook topic.
    # + payload - A JSON payload containing a callback URI. Constant Contact uses this callback URI to notify you about your chosen topic.
    # + return - Request successful.
    remote isolated function putWebhooksTopic(string topicId, WebhooksSubscriptionBody payload) returns WebhooksSubscriptionPutResp|error {
        string  path = string `/partner/webhooks/subscriptions/${topicId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhooksSubscriptionPutResp response = check self.clientEp->put(path, request, targetType=WebhooksSubscriptionPutResp);
        return response;
    }
    # DELETE Webhook Topic Subscriptions
    #
    # + topicId - Identifies a webhook topic.
    # + return - Webhooks subscription successfully deleted.
    remote isolated function deleteWebhooksSubscriptions(string topicId) returns http:Response|error {
        string  path = string `/partner/webhooks/subscriptions/${topicId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # POST Test Send Webhook Notification
    #
    # + topicId - Identifies a webhook topic.
    # + return - Test notification successfully sent to your callback URI.
    remote isolated function testSendWebhooksTopic(string topicId) returns WebhooksTestSend|error {
        string  path = string `/partner/webhooks/subscriptions/${topicId}/tests`;
        http:Request request = new;
        //TODO: Update the request as needed;
        WebhooksTestSend response = check self.clientEp-> post(path, request, targetType = WebhooksTestSend);
        return response;
    }
    # Access Token Information
    #
    # + payload - A JSON request payload containing a valid OAuth2.0 access token.
    # + return - Request Successful
    remote isolated function postAuthCode(AuthToken payload) returns AuthInfoResponse|error {
        string  path = string `/token_info`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AuthInfoResponse response = check self.clientEp->post(path, request, targetType=AuthInfoResponse);
        return response;
    }
    # V3 Authorization service endpoint for OAuth 2.0 flows
    #
    # + responseType - Specifies the type requested from the authorization service. For server flow set to code; for client flow set to token.
    # + clientId - The API key for the client.
    # + redirectUri - Tells the Authorization service where to send the user once access is granted. This must be the same redirect_uri associated with your_API_key
    # + return - 302 response
    remote isolated function getAuthCode(string responseType, string clientId, string redirectUri) returns http:Response|error {
        string  path = string `/idfed`;
        map<anydata> queryParam = {"response_type": responseType, "client_id": clientId, "redirect_uri": redirectUri};
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
