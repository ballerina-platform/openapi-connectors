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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Karbon API v3.0](https://developers.karbonhq.com/api) OpenAPI specification.
# Leverage the Karbon API to integrate your apps with Karbon, build custom solutions, optimize workflows and power your business.
@display {label: "Karbon", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Karbon account](https://developers.karbonhq.com) and obtain tokens by following [this guide](https://help.karbonhq.com/en/articles/4324748-how-do-i-find-my-karbon-api-access-key).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.karbonhq.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get and/or Filter a Paged List of Client Groups
    #
    # + accessKey - Access Key 
    # + filter - Restricts the set of items returned. The maximum number of expressions is 100. The allowed logical operators are: eq, and. The allowed properties are: FullName. 
    # + orderby - Specifies the order in which items are returned. The maximum number of expressions is 5. The allowed properties are: FullName. 
    # + top - Limits the number of items returned from a collection. The maximum value is 100. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getClientGroups(string accessKey, string? filter = (), string? orderby = (), int? top = (), int? skip = ()) returns MicrosoftAspnetOdataPageresultKarbonApiContactsV2Clientgroupsummarydto|error {
        string resourcePath = string `/v3/ClientGroups`;
        map<anydata> queryParam = {"$filter": filter, "$orderby": orderby, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MicrosoftAspnetOdataPageresultKarbonApiContactsV2Clientgroupsummarydto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Client Group
    #
    # + accessKey - Access Key 
    # + payload - The new Client Group to Create 
    # + return - Client Group successfully created 
    remote isolated function postClientGroups(string accessKey, KarbonApiContactsV2Clientgroupdto payload) returns KarbonApiContactsV2Clientgroupdto|error {
        string resourcePath = string `/v3/ClientGroups`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KarbonApiContactsV2Clientgroupdto response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a single Client Group by supplied Key
    #
    # + accessKey - Access Key 
    # + 'key - The Client Group Key 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getClientGroupByKey(string accessKey, string 'key, string? expand = ()) returns KarbonApiContactsV2Clientgroupdto|error {
        string resourcePath = string `/v3/ClientGroups/${getEncodedUri('key)}`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiContactsV2Clientgroupdto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Perform a full update of a Client Group
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Client Group to update 
    # + payload - The new (full) details of the Client Group to update with. 
    # + return - Client Group successfully updated 
    remote isolated function putClientGroups(string accessKey, string 'key, KarbonApiContactsV2Clientgroupdto payload) returns http:Response|error {
        string resourcePath = string `/v3/ClientGroups/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Perform a Partial update of a Client Group
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Client Group to update 
    # + payload - The new details of the Client Group to update. NOTE only the properties to be updated need to be provided 
    # + return - Client Group successfully updated 
    remote isolated function patchClientGroups(string accessKey, string 'key, KarbonApiContactsV2Clientgroupdto payload) returns http:Response|error {
        string resourcePath = string `/v3/ClientGroups/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a Client Group from the supplied User Defined Identifier
    #
    # + accessKey - Access Key 
    # + userDefinedIdentifier - The UserDefinedIdentifier 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getClientGroupByUserDefinedIdentifier(string accessKey, string userDefinedIdentifier, string? expand = ()) returns KarbonApiContactsV2Clientgroupdto|error {
        string resourcePath = string `/v3/ClientGroups/GetClientGroupByUserDefinedIdentifier(UserDefinedIdentifier='${getEncodedUri(userDefinedIdentifier)}')`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiContactsV2Clientgroupdto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get and/or Filter a Paged List of Contacts
    #
    # + accessKey - Access Key 
    # + filter - Restricts the set of items returned. The maximum number of expressions is 100. The allowed logical operators are: eq, and. The allowed properties are: FullName, EmailAddress, PhoneNumber. 
    # + orderby - Specifies the order in which items are returned. The maximum number of expressions is 5. The allowed properties are: FullName, LastModifiedDateTime. 
    # + top - Limits the number of items returned from a collection. The maximum value is 100. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getContacts(string accessKey, string? filter = (), string? orderby = (), int? top = (), int? skip = ()) returns MicrosoftAspnetOdataPageresultKarbonApiContactsV2Contactsummarydto|error {
        string resourcePath = string `/v3/Contacts`;
        map<anydata> queryParam = {"$filter": filter, "$orderby": orderby, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MicrosoftAspnetOdataPageresultKarbonApiContactsV2Contactsummarydto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Contact
    #
    # + accessKey - Access Key 
    # + payload - The new Contact to Create 
    # + return - Contact successfully created 
    remote isolated function postContacts(string accessKey, KarbonApiContactsV2Contactdto payload) returns json|error {
        string resourcePath = string `/v3/Contacts`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a single Contact by supplied Key
    #
    # + accessKey - Access Key 
    # + 'key - The Contact Key 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getContactByKey(string accessKey, string 'key, string? expand = ()) returns json|error {
        string resourcePath = string `/v3/Contacts/${getEncodedUri('key)}`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Perform a full update of a Contact
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Contact to update 
    # + payload - The new (full) details of the Contact to update with. 
    # + return - Contact successfully updated 
    remote isolated function putContacts(string accessKey, string 'key, KarbonApiContactsV2Contactdto payload) returns http:Response|error {
        string resourcePath = string `/v3/Contacts/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Perform a Partial update of a Contact
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Contact to update 
    # + payload - The new details of the Contact to update. NOTE only the properties to be updated need to be provided 
    # + return - Contact successfully updated 
    remote isolated function patchContacts(string accessKey, string 'key, KarbonApiContactsV2Contactdto payload) returns http:Response|error {
        string resourcePath = string `/v3/Contacts/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a contact from the supplied User Defined Identifier
    #
    # + accessKey - Access Key 
    # + userDefinedIdentifier - The UserDefinedIdentifier 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getContactByUserDefinedIdentifier(string accessKey, string userDefinedIdentifier, string? expand = ()) returns json|error {
        string resourcePath = string `/v3/Contacts/GetContactByUserDefinedIdentifier(UserDefinedIdentifier='${getEncodedUri(userDefinedIdentifier)}')`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Note
    #
    # + accessKey - Access Key 
    # + payload - The new Note to Create 
    # + return - Note successfully created 
    remote isolated function postNotes(string accessKey, KarbonApiContentitemsNotedto payload) returns KarbonApiContentitemsNotedto|error {
        string resourcePath = string `/v3/Notes`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KarbonApiContentitemsNotedto response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get and/or Filter a Paged List of Organizations
    #
    # + accessKey - Access Key 
    # + filter - Restricts the set of items returned. The maximum number of expressions is 100. The allowed logical operators are: eq, and. The allowed properties are: FullName. 
    # + orderby - Specifies the order in which items are returned. The maximum number of expressions is 5. The allowed properties are: FullName, LastModifiedDateTime. 
    # + top - Limits the number of items returned from a collection. The maximum value is 100. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getOrganizations(string accessKey, string? filter = (), string? orderby = (), int? top = (), int? skip = ()) returns MicrosoftAspnetOdataPageresultKarbonApiContactsV2Organizationsummarydto|error {
        string resourcePath = string `/v3/Organizations`;
        map<anydata> queryParam = {"$filter": filter, "$orderby": orderby, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MicrosoftAspnetOdataPageresultKarbonApiContactsV2Organizationsummarydto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an Organization
    #
    # + accessKey - Access Key 
    # + payload - The new Organization to Create 
    # + return - Organization successfully created 
    remote isolated function postOrganizations(string accessKey, KarbonApiContactsV2Organizationdto payload) returns json|error {
        string resourcePath = string `/v3/Organizations`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a single organization by supplied Key
    #
    # + accessKey - Access Key 
    # + 'key - The Organization Key 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getOrganizationByKey(string accessKey, string 'key, string? expand = ()) returns json|error {
        string resourcePath = string `/v3/Organizations/${getEncodedUri('key)}`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Perform a full update of an Organization
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Organization to update 
    # + payload - The new (full) details of the Organization to update with. 
    # + return - Organization successfully updated 
    remote isolated function putOrganizations(string accessKey, string 'key, KarbonApiContactsV2Organizationdto payload) returns http:Response|error {
        string resourcePath = string `/v3/Organizations/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Perform a Partial update of an Organization
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Organization to update 
    # + payload - The new details of the Organization to update. NOTE only the properties to be updated need to be provided 
    # + return - Organization successfully updated 
    remote isolated function organizationsPatch(string accessKey, string 'key, KarbonApiContactsV2Organizationdto payload) returns http:Response|error {
        string resourcePath = string `/v3/Organizations/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get an organization from the supplied User Defined Identifier
    #
    # + accessKey - Access Key 
    # + userDefinedIdentifier - User defined identifier 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getOrganizationByUserDefinedIdentifier(string accessKey, string userDefinedIdentifier, string? expand = ()) returns json|error {
        string resourcePath = string `/v3/Organizations/GetOrganizationByUserDefinedIdentifier(UserDefinedIdentifier='${getEncodedUri(userDefinedIdentifier)}')`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Search for timesheets by date or work item.
    #
    # + accessKey - Access Key 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. The allowed properties are: TimeEntries. 
    # + filter - Restricts the set of items returned. The maximum number of expressions is 100. The allowed logical operators are: eq, and. The allowed properties are: StartDate, EndDate, UserKey, WorkItemKeys, Status. 
    # + orderby - Specifies the order in which items are returned. The maximum number of expressions is 5. The allowed properties are: StartDate, EndDate. 
    # + top - Limits the number of items returned from a collection. The maximum value is 100. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getTimesheets(string accessKey, string? expand = (), string? filter = (), string? orderby = (), int? top = (), int? skip = ()) returns KarbonApiTimeV3Timesheetdto[]|error {
        string resourcePath = string `/v3/Timesheets`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$orderby": orderby, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiTimeV3Timesheetdto[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get an individual timesheet by key.
    #
    # + accessKey - Access Key 
    # + 'key - The timesheet Key 
    # + expand - Indicates the related entities to be represented inline. The maximum depth is 2. 
    # + return - OK 
    remote isolated function getTimesheetByKey(string accessKey, string 'key, string? expand = ()) returns KarbonApiTimeV3Timesheetdto|error {
        string resourcePath = string `/v3/Timesheets/${getEncodedUri('key)}`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiTimeV3Timesheetdto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List of Users
    #
    # + accessKey - Access Key 
    # + top - Limits the number of items returned from a collection. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getUsers(string accessKey, int? top = (), int? skip = ()) returns KarbonApiTenantUserdto[]|error {
        string resourcePath = string `/v3/Users`;
        map<anydata> queryParam = {"$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiTenantUserdto[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a User
    #
    # + accessKey - Access Key 
    # + payload - The new User to Create 
    # + return - User successfully created 
    remote isolated function postUsers(string accessKey, KarbonApiTenantUserdto payload) returns json|error {
        string resourcePath = string `/v3/Users`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a single Webhook Subscription
    #
    # + accessKey - Access Key 
    # + return - Webhook Subscription found 
    remote isolated function getWebhookSubscriptions(string accessKey) returns KarbonApiModelsContactsV3Webhooksubscriptiondto|error {
        string resourcePath = string `/v3/WebhookSubscriptions`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiModelsContactsV3Webhooksubscriptiondto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or Update a Webhook Subscription
    #
    # + accessKey - Access Key 
    # + payload - The Webhook Subscription to Create or Update 
    # + return - Webhook Subscription target URL successfully created 
    remote isolated function postWebhookSubscriptions(string accessKey, KarbonApiModelsContactsV3Webhooksubscriptiondto payload) returns KarbonApiModelsContactsV3Webhooksubscriptiondto|error {
        string resourcePath = string `/v3/WebhookSubscriptions`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KarbonApiModelsContactsV3Webhooksubscriptiondto response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get and/or Filter a Paged List of Work
    #
    # + accessKey - Access Key 
    # + filter - Restricts the set of items returned. The maximum number of expressions is 100. The allowed logical operators are: eq, ge, le, and. The allowed properties are: ClientKey, AssigneeEmailAddress, PrimaryStatus, WorkStatus, StartDate. 
    # + orderby - Specifies the order in which items are returned. The maximum number of expressions is 5. The allowed properties are: StartDate. 
    # + top - Limits the number of items returned from a collection. The maximum value is 100. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getWorkItems(string accessKey, string? filter = (), string? orderby = (), int? top = (), int? skip = ()) returns MicrosoftAspnetOdataPageresultKarbonApiModelsWorkV3Workitemsummarydto|error {
        string resourcePath = string `/v3/WorkItems`;
        map<anydata> queryParam = {"$filter": filter, "$orderby": orderby, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MicrosoftAspnetOdataPageresultKarbonApiModelsWorkV3Workitemsummarydto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a WorkItem
    #
    # + accessKey - Access Key 
    # + payload - The new Work Item to Create 
    # + return - WorkItem successfully created 
    remote isolated function postWorkItems(string accessKey, KarbonApiModelsWorkV3Workitemdto payload) returns KarbonApiModelsWorkV3Workitemdto|error {
        string resourcePath = string `/v3/WorkItems`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KarbonApiModelsWorkV3Workitemdto response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a single Work Item by supplied Key
    #
    # + accessKey - Access Key 
    # + 'key - The Work Key 
    # + return - OK 
    remote isolated function getWorkItemByKey(string accessKey, string 'key) returns KarbonApiModelsWorkV3Workitemdto|error {
        string resourcePath = string `/v3/WorkItems/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiModelsWorkV3Workitemdto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Perform a full update of a WorkItem
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Work Item to update 
    # + payload - The new (full) details of the WorkItem to update with. 
    # + return - Work Item successfully updated 
    remote isolated function putWorkItems(string accessKey, string 'key, KarbonApiModelsWorkV3Workitemdto payload) returns http:Response|error {
        string resourcePath = string `/v3/WorkItems/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Perform a Partial update of a Work Item
    #
    # + accessKey - Access Key 
    # + 'key - Key of the Work Item to update 
    # + payload - The new details of the Work Item to update. NOTE only the properties to be updated need to be provided 
    # + return - WorkItem successfully updated 
    remote isolated function patchWorkItems(string accessKey, string 'key, KarbonApiModelsWorkV3Workitemdto payload) returns http:Response|error {
        string resourcePath = string `/v3/WorkItems/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a single Work Schedule by supplied Key
    #
    # + accessKey - Access Key 
    # + 'key - The Work Schedule Key 
    # + return - OK 
    remote isolated function getWorkScheduleByKey(string accessKey, string 'key) returns KarbonApiWorkV3Workscheduledto|error {
        string resourcePath = string `/v3/WorkSchedules/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiWorkV3Workscheduledto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Perform a full update of a Work Schedule
    #
    # + accessKey - Access Key 
    # + payload - The new full details of the Work Schedule 
    # + return - Work Schedule successfully updated 
    remote isolated function putWorkSchedules(string accessKey, KarbonApiWorkV3Workscheduledto payload) returns http:Response|error {
        string resourcePath = string `/v3/WorkSchedules`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a Work Schedule
    #
    # + accessKey - Access Key 
    # + payload - The new Work Schedule to create 
    # + return - Work Schedule successfully created 
    remote isolated function createWorkSchedule(string accessKey, KarbonApiWorkV3Workscheduledto payload) returns KarbonApiWorkV3Workscheduledto|error {
        string resourcePath = string `/v3/WorkSchedules`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KarbonApiWorkV3Workscheduledto response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get and/or Filter a Paged List of Work Templates
    #
    # + accessKey - Access Key 
    # + filter - Restricts the set of items returned. The maximum number of expressions is 100. The allowed functions are: startswith. The allowed properties are: Title, WorkTypeKey, HasScheduledClientTaskGroups, EstimatedBudget, EstimatedTime, DraftHasChanges, PublishedDate, NumberOfWorkItemsCreated, DateLastWorkItemCreated, DateModified. 
    # + orderby - Specifies the order in which items are returned. The maximum number of expressions is 5. The allowed properties are: WorkTypeKey, EstimatedBudget, EstimatedTime, PublishedDate, NumberOfWorkItemsCreated, DateLastWorkItemCreated, DateModified. 
    # + top - Limits the number of items returned from a collection. The maximum value is 10. 
    # + skip - Excludes the specified number of items of the queried collection from the result. 
    # + return - OK 
    remote isolated function getWorkTemplates(string accessKey, string? filter = (), string? orderby = (), int? top = (), int? skip = ()) returns MicrosoftAspnetOdataPageresultKarbonApiWorkV3Worktemplatedto|error {
        string resourcePath = string `/v3/WorkTemplates`;
        map<anydata> queryParam = {"$filter": filter, "$orderby": orderby, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MicrosoftAspnetOdataPageresultKarbonApiWorkV3Worktemplatedto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets a single Work Template by supplied Key
    #
    # + accessKey - Access Key 
    # + 'key - The Work Template Key 
    # + return - OK 
    remote isolated function getWorkTemplateByKey(string accessKey, string 'key) returns KarbonApiWorkV3Worktemplatedto|error {
        string resourcePath = string `/v3/WorkTemplates/${getEncodedUri('key)}`;
        map<any> headerValues = {"AccessKey": accessKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KarbonApiWorkV3Worktemplatedto response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
