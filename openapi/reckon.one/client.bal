// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [Reckon One API v2](https://developer.reckon.com/api-details#api=reckon-one-api-v2) OpenAPI specification.
# Reckon One is a new generation, modular cloud accounting solution that scales with your business – perfect for startups. This is version 2 of the Reckon One API.
@display {label: "Reckon One", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Reckon account](https://developer.reckon.com) and obtain tokens by following [this guide](https://developer.reckon.com/get-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api-v2.reckonone.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Gets a list of books that the current user has access to.
    #
    # + return - A list of books. 
    remote isolated function getBooks() returns Books|error {
        string resourcePath = string `/books`;
        Books response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets details of the specified book.
    #
    # + bookId - The book's id. 
    # + return - Details of the book. 
    remote isolated function getBook(string bookId) returns Book|error {
        string resourcePath = string `/books/${bookId}`;
        Book response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of credit notes.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of credit notes per page. 
    # + return - A paged list of credit notes for the specified book. 
    remote isolated function getCreditNotes(string bookId, int page = 1, int perPage = 0) returns CreditNotes|error {
        string resourcePath = string `/${bookId}/creditnotes`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CreditNotes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + format - The format to use, e.g. pdf. 
    # + return - The requested credit note. 
    remote isolated function getCreditNote(string bookId, string creditNoteId, string? format = ()) returns CreditNote|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CreditNote response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + payload - Details of the updated credit note. 
    # + return - The result of the update. 
    remote isolated function updateCreditNote(string bookId, string creditNoteId, CreditNoteInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteCreditNote(string bookId, string creditNoteId) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchCreditNote(string bookId, string creditNoteId, CreditNotePatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Creates a new credit note.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new credit note. 
    # + return - The id of the credit note that has been created. 
    remote isolated function createCreditNote(string bookId, CreditNoteInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/creditNotes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a line item from a credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + lineItemId - The line item's id. 
    # + return - The requested credit note line item. 
    remote isolated function getCreditNoteLineItem(string bookId, string creditNoteId, string lineItemId) returns CreditNoteLineItem|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/lineItems/${lineItemId}`;
        CreditNoteLineItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing credit note's line item.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + lineItemId - The credit note line item's id. 
    # + payload - Details of the updated credit note's line item. 
    # + return - The result of the update. 
    remote isolated function updateCreditNoteLineItem(string bookId, string creditNoteId, string lineItemId, CreditNoteLineItemInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/lineItems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing credit note line item.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + lineItemId - The id of the line item to delete. 
    # + return - The result of the deletion. 
    remote isolated function deleteLineItem(string bookId, string creditNoteId, string lineItemId) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/lineItems/${lineItemId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing credit note's line item.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + lineItemId - The credit note line item's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchCreditNoteLineItem(string bookId, string creditNoteId, string lineItemId, CreditNoteLineItemPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/lineItems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Creates a new line item within an existing credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + payload - Details of the new line item. 
    # + return - The id of the line item that has been created. 
    remote isolated function addLineItemToCreditNote(string bookId, string creditNoteId, CreditNoteLineItemInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/lineItems`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a new transaction link.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + payload - Details of the transaction to link. 
    # + return - The linked transaction's id. 
    remote isolated function createCreditNoteTransactionLink(string bookId, string creditNoteId, CreditNoteTransactionLinkInput payload) returns StringIdResponse|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/transactionLinks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringIdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unlinks an existing transaction from a credit note.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + linkId - The link's id. 
    # + return - The result of the request to unlink the transaction. 
    remote isolated function unlinkTransaction(string bookId, string creditNoteId, string linkId) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/transactionlinks/${linkId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing credit note's linked transaction.
    #
    # + bookId - The book's id. 
    # + creditNoteId - The credit note's id. 
    # + linkId - The linked transaction's id. 
    # + payload - Details of the linked transaction to update. 
    # + return - The result of the update. 
    remote isolated function patchCreditNoteTransactionLink(string bookId, string creditNoteId, string linkId, CreditNoteTransactionLinkPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/creditNotes/${creditNoteId}/transactionlinks/${linkId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of customers.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of customers per page. 
    # + return - A paged list of customers for the specified book. 
    remote isolated function getCustomers(string bookId, int page = 1, int perPage = 0) returns Customers|error {
        string resourcePath = string `/${bookId}/customers`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Customers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new customer.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new customer. 
    # + return - The id of the customer that has been created. 
    remote isolated function createCustomer(string bookId, CustomerInput payload) returns IdNameResponse|error {
        string resourcePath = string `/${bookId}/customers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdNameResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + return - The requested customer. 
    remote isolated function getCustomer(string bookId, string customerId) returns Customer|error {
        string resourcePath = string `/${bookId}/customers/${customerId}`;
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + payload - Details of the updated customer. 
    # + return - The result of the update. 
    remote isolated function updateCustomer(string bookId, string customerId, CustomerInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteCustomer(string bookId, string customerId) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + payload - Details of the customer to change. 
    # + return - The result of the update. 
    remote isolated function patchCustomer(string bookId, string customerId, CustomerPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Links an existing contact to a customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + contactId - The contact's id to be linked to the customer. 
    # + return - The result of linking an existing contact to a customer. 
    remote isolated function linkExistingContactToCustomer(string bookId, string customerId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/contacts/${contactId}/link`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unlinks a customer's linked contact.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + contactId - The customer's linked contact's id. 
    # + return - The result of the unlink procedure. 
    remote isolated function unlinkCustomerLinkedContact(string bookId, string customerId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/contacts/${contactId}/unlink`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Creates a new contact and links it to the customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + payload - Details of the new contact. 
    # + return - The id of the contact that has been created. 
    remote isolated function addNewContactToCustomer(string bookId, string customerId, LinkedContactInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a customer's linked Contact details.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + contactId - The contact's id. 
    # + return - The requested customer's linked contact. 
    remote isolated function getCustomerLinkedContact(string bookId, string customerId, string contactId) returns Contact|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/contacts/${contactId}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    #            Deletes a contact from a customer
    #            
    #
    # + bookId - The book's id 
    # + customerId - The customer's id 
    # + contactId - The contact's id being deleted 
    # + return - The result of the delete procedure. 
    remote isolated function deleteContactFromCustomer(string bookId, string customerId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/contacts/${contactId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets a customer's phone numbers.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + return - The requested customer's phone numbers. 
    remote isolated function getCustomerPhoneNumbers(string bookId, string customerId) returns PhoneNumbers|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/phoneNumbers`;
        PhoneNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new phone number to an existing customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + payload - The details of the phone number to add. 
    # + return - The id and name of the phone number type that has been created. 
    remote isolated function createCustomerPhoneNumber(string bookId, string customerId, PhoneNumberInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/phoneNumbers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a customer's phone number.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The phone number's type by name or id. 
    # + return - The customer's specific phone number. 
    remote isolated function getCustomerPhoneNumber(string bookId, string customerId, string 'type) returns PhoneNumber|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/phoneNumbers/${'type}`;
        PhoneNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a customer's phone number.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The phone number type by name or id. 
    # + payload - The phone number. 
    # + return - The result of the update. 
    remote isolated function updateCustomerPhoneNumber(string bookId, string customerId, string 'type, UpdatePhoneNumberInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing customer phone number.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The phone number's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteCustomerPhoneNumber(string bookId, string customerId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/phoneNumbers/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing customer phone number.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The phone number's type by name or id. 
    # + payload - Details of the phone number to change. 
    # + return - The result of the update. 
    remote isolated function patchCustomerPhoneNumber(string bookId, string customerId, string 'type, PhoneNumberPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a customer's addresses.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + return - The requested customer's addresses. 
    remote isolated function getCustomerAddresses(string bookId, string customerId) returns Addresses|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/addresses`;
        Addresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new address to an existing customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + payload - Details of the new address. 
    # + return - The id of the address that has been created. 
    remote isolated function createCustomerAddress(string bookId, string customerId, AddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a customer's address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The address's type by name or id. 
    # + return - The customer's specific address. 
    remote isolated function getCustomerAddress(string bookId, string customerId, string 'type) returns Address|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/addresses/${'type}`;
        Address response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a customer's address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The address's type by name or id. 
    # + payload - The address. 
    # + return - The result of the update. 
    remote isolated function updateCustomerAddress(string bookId, string customerId, string 'type, UpdateAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing customer address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteCustomerAddress(string bookId, string customerId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/addresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing customer address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The address's type by name or id. 
    # + payload - Details of the customer's address to change. 
    # + return - The result of the update. 
    remote isolated function patchCustomerAddress(string bookId, string customerId, string 'type, AddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a customer's electronic address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The electronic address's type by name or id. 
    # + return - The customer's specific electronic address. 
    remote isolated function getCustomerElectronicAddress(string bookId, string customerId, string 'type) returns ElectronicAddress|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/electronicAddresses/${'type}`;
        ElectronicAddress response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a customer's electronic address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The electronic address's type by name or id. 
    # + payload - The electronic address. 
    # + return - The result of the update. 
    remote isolated function updateCustomerElectronicAddress(string bookId, string customerId, string 'type, UpdateElectronicAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing customer electronic address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The electronic address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteCustomerElectronicAddress(string bookId, string customerId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/electronicAddresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing customer electronic address.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + 'type - The electronic address type by name or id. 
    # + payload - Details of the customer's electronic address to update. 
    # + return - The result of the update. 
    remote isolated function patchCustomerElectronicAddress(string bookId, string customerId, string 'type, ElectronicAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a customer's electronic addresses.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + return - The requested customer's electronic addresses. 
    remote isolated function getCustomerElectronicAddresses(string bookId, string customerId) returns ElectronicAddresses|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/electronicAddresses`;
        ElectronicAddresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new electronic address to an existing customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer's id. 
    # + payload - The details of the electronic address to add. 
    # + return - The id and name of the electronic address type that has been created. 
    remote isolated function createCustomerElectronicAddress(string bookId, string customerId, ElectronicAddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/customers/${customerId}/electronicAddresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a list of departments.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of departments per page. 
    # + return - A paged list of departments for the specified book. 
    remote isolated function getDepartments(string bookId, int page = 1, int perPage = 0) returns Departments|error {
        string resourcePath = string `/${bookId}/departments`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Departments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new department.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new department. 
    # + return - The id of the department that has been created. 
    remote isolated function createDepartment(string bookId, DepartmentInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/departments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + return - The requested department. 
    remote isolated function getDepartment(string bookId, string departmentId) returns Department|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}`;
        Department response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + payload - Details of the department. 
    # + return - The result of the update. 
    remote isolated function updateDepartment(string bookId, string departmentId, DepartmentInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteDepartment(string bookId, string departmentId) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing department.
    #
    # + bookId - The book's id. 
    # + departmentId - The departments's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchDepartment(string bookId, string departmentId, DepartmentPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Links a manager to a department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + employeeId - The manager's id to be linked to the department. 
    # + return - The result of linking a manager to a department. 
    remote isolated function linkManagerToDepartment(string bookId, string departmentId, string employeeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}/managers/${employeeId}/link`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unlinks a manager from a department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + employeeId - The manager's id linked to the department. 
    # + return - The result of the unlink procedure. 
    remote isolated function unlinkDepartmentLinkedManager(string bookId, string departmentId, string employeeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}/managers/${employeeId}/unlink`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Links an employee to a department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + employeeId - The employees id to be linked to the department. 
    # + return - The result of linking an employee to a department. 
    remote isolated function linkEmployeeToDepartment(string bookId, string departmentId, string employeeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}/employees/${employeeId}/link`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unlinks an employee from a department.
    #
    # + bookId - The book's id. 
    # + departmentId - The department's id. 
    # + employeeId - The employees id linked to the department. 
    # + return - The result of the unlink procedure. 
    remote isolated function unlinkDepartmentLinkedEmployee(string bookId, string departmentId, string employeeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/departments/${departmentId}/employees/${employeeId}/unlink`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets a list of payment methods.
    #
    # + bookId - The book's id. 
    # + return - A list of payment methods for the specified book. 
    remote isolated function getPaymentMethods(string bookId) returns PaymentMethods|error {
        string resourcePath = string `/${bookId}/paymentMethods`;
        PaymentMethods response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a list of payments.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of payments per page. 
    # + return - A paged list of payments for the specified book. 
    remote isolated function getPayments(string bookId, int page = 1, int perPage = 0) returns Payments|error {
        string resourcePath = string `/${bookId}/payments`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Payments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a payment.
    #
    # + bookId - The book's id. 
    # + paymentId - The payments id. 
    # + format - The format to use, e.g. pdf. 
    # + return - A single payment. 
    remote isolated function getPayment(string bookId, string paymentId, string? format = ()) returns Payment|error {
        string resourcePath = string `/${bookId}/payments/${paymentId}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Payment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current user's permissions.
    #
    # + bookId - The book's id. 
    # + return - An array of the current user's permissions. 
    remote isolated function getUserPermissions(string bookId) returns Permissions|error {
        string resourcePath = string `/${bookId}/permissions`;
        Permissions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of receipts.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of receipts per page. 
    # + return - A paged list of receipts for the specified book. 
    remote isolated function getReceipts(string bookId, int page = 1, int perPage = 0) returns Receipts|error {
        string resourcePath = string `/${bookId}/receipts`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Receipts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new receipt.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new receipt. 
    # + return - The id of the receipt that has been created. 
    remote isolated function createReceipt(string bookId, ReceiptInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/receipts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + format - The format to use, e.g. pdf. 
    # + return - The requested receipt. 
    remote isolated function getReceipt(string bookId, string receiptId, string? format = ()) returns Receipt|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Receipt response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + payload - Details of the updated receipt. 
    # + return - The result of the update. 
    remote isolated function updateReceipt(string bookId, string receiptId, ReceiptInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteReceipt(string bookId, string receiptId) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + payload - Details of the receipt to update. 
    # + return - The result of the update. 
    remote isolated function patchReceipt(string bookId, string receiptId, ReceiptPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a line item from a receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + lineItemId - The line item's id. 
    # + return - The line item. 
    remote isolated function getReceiptLineItem(string bookId, string receiptId, string lineItemId) returns ReceiptLineItem|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/lineItems/${lineItemId}`;
        ReceiptLineItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing line item within an existing receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + lineItemId - The line item's id. 
    # + payload - Details of the line item. 
    # + return - The result of the update. 
    remote isolated function updateReceiptLineItem(string bookId, string receiptId, string lineItemId, ReceiptLineItemInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/lineItems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Creates a new line item within an existing receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + payload - Details of the new line item. 
    # + return - The id of the line item that has been created. 
    remote isolated function addLineItemToReceipt(string bookId, string receiptId, ReceiptLineItemInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/lineItems`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates selected fields of an existing line item within an existing receipt.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + lineItemId - The id of the line item to update. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchReceiptLineItem(string bookId, string receiptId, string lineItemId, ReceiptLineItemPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/lineitems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Deletes an existing receipt's line item.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + lineId - The receipt's line item id. 
    # + return - The result of the deletion. 
    remote isolated function deleteReceiptLineItem(string bookId, string receiptId, string lineId) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/lineitems/${lineId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Creates a new transaction link.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + payload - Details of the transaction to link. 
    # + return - The linked transaction's id. 
    remote isolated function createReceiptTransactionLink(string bookId, string receiptId, ReceiptTransactionLinkInput payload) returns StringIdResponse|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/transactionLinks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringIdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes an existing receipt's linked transaction.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + linkId - The receipt's allocation link id. 
    # + return - The result of the deletion. 
    remote isolated function deleteReceiptTransactionLink(string bookId, string receiptId, string linkId) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/transactionlinks/${linkId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing receipt's linked transaction.
    #
    # + bookId - The book's id. 
    # + receiptId - The receipt's id. 
    # + linkId - The linked transaction's id. 
    # + payload - Details of the linked transaction to update. 
    # + return - The result of the update. 
    remote isolated function patchReceiptTransactionLink(string bookId, string receiptId, string linkId, ReceiptTransactionLinkPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/receipts/${receiptId}/transactionlinks/${linkId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of roles.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of roles per page. 
    # + return - A paged list of roles for the specified book. 
    remote isolated function getRoles(string bookId, int page = 1, int perPage = 0) returns Roles|error {
        string resourcePath = string `/${bookId}/roles`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Roles response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a role.
    #
    # + bookId - The book's id. 
    # + roleId - The role's id. 
    # + return - The requested role. 
    remote isolated function getRole(string bookId, int roleId) returns Role|error {
        string resourcePath = string `/${bookId}/roles/${roleId}`;
        Role response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Links a user to a role.
    #
    # + bookId - The book's id. 
    # + roleId - The role's id. 
    # + userId - The user's id to be linked to the role. 
    # + return - The result of linking an user to a role. 
    remote isolated function linkUserToRole(string bookId, int roleId, string userId) returns http:Response|error {
        string resourcePath = string `/${bookId}/roles/${roleId}/users/${userId}/link`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets a list of super fund providers.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super fund providers per page. 
    # + return - A paged list of super fund providers for the specified book. 
    remote isolated function getSuperfundProviders(string bookId, int page = 1, int perPage = 0) returns SuperfundProviders|error {
        string resourcePath = string `/${bookId}/superfundProviders`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuperfundProviders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of super fund providers having a product with the provided USI.
    #
    # + bookId - The book Id. 
    # + usi - The USI of a fund product. 
    # + page - The page to retrieve. 
    # + perPage - The number of super fund providers having a product with the provided USI per page. 
    # + return - A paged list of super fund providers having a product with the provided USI for the specified book. 
    remote isolated function getSuperfundProvidersHavingUsi(string bookId, string usi, int page = 1, int perPage = 0) returns SuperfundProviders|error {
        string resourcePath = string `/${bookId}/superfundProviders/havingUsi/${usi}`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuperfundProviders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a super fund provider.
    #
    # + bookId - The book's id. 
    # + superfundProviderId - The super fund provider's id. 
    # + return - The requested super fund provider. 
    remote isolated function getSuperfundProvider(string bookId, string superfundProviderId) returns SuperfundProvider|error {
        string resourcePath = string `/${bookId}/superfundProviders/${superfundProviderId}`;
        SuperfundProvider response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of a super fund provider's products.
    #
    # + bookId - The book's id. 
    # + superfundProviderId - The super fund provider's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super fund provider products per page. 
    # + return - A paged list of a super fund provider's products for the specified book. 
    remote isolated function getSuperfundProviderProducts(string bookId, string superfundProviderId, int page = 1, int perPage = 0) returns SuperfundProviderProducts|error {
        string resourcePath = string `/${bookId}/superfundProviders/${superfundProviderId}/products`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SuperfundProviderProducts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of reports.
    #
    # + bookId - The book's id. 
    # + return - A list of reports for the specified book. 
    remote isolated function getReports(string bookId) returns Reports|error {
        string resourcePath = string `/${bookId}/reports`;
        Reports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the payroll leave balances and accrual value report.
    #
    # + bookId - The book's id. 
    # + format - The format to use, e.g. pdf. 
    # + payload - The report parameters. 
    # + return - The report. 
    remote isolated function getPayrollLeaveBalancesAndAccrualValueReport2(string bookId, PayrollLeaveBalancesAndAccrualValueReportParameters payload, string? format = ()) returns PayrollLeaveBalancesAndAccrualValueReport|error {
        string resourcePath = string `/${bookId}/reports/payrollLeaveBalancesAndAccrualValue`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PayrollLeaveBalancesAndAccrualValueReport response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a list of suppliers.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of suppliers per page. 
    # + return - A paged list of suppliers for the specified book. 
    remote isolated function getSuppliers(string bookId, int page = 1, int perPage = 0) returns Suppliers|error {
        string resourcePath = string `/${bookId}/suppliers`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Suppliers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new supplier.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new supplier. 
    # + return - The id of the supplier that has been created. 
    remote isolated function createSupplier(string bookId, SupplierInput payload) returns IdNameResponse|error {
        string resourcePath = string `/${bookId}/suppliers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdNameResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + return - The requested supplier. 
    remote isolated function getSupplier(string bookId, string supplierId) returns Supplier|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}`;
        Supplier response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The suppliers's id. 
    # + payload - Details of the updated supplier. 
    # + return - The result of the update. 
    remote isolated function updateSupplier(string bookId, string supplierId, SupplierInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteSupplier(string bookId, string supplierId) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + payload - Details of the supplier to change. 
    # + return - The result of the update. 
    remote isolated function patchSupplier(string bookId, string supplierId, SupplierPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a supplier's addresses.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + return - The requested supplier's addresses. 
    remote isolated function getSupplierAddresses(string bookId, string supplierId) returns Addresses|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/addresses`;
        Addresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new address to an existing supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + payload - The address. 
    # + return - The result of the update. 
    remote isolated function createSupplierAddress(string bookId, string supplierId, AddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a supplier's address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The type of address by name or id. 
    # + return - The supplier's requested address. 
    remote isolated function getSupplierAddress(string bookId, string supplierId, string 'type) returns Address|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/addresses/${'type}`;
        Address response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing supplier address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The address type by name or id. 
    # + payload - The address. 
    # + return - The result of the update. 
    remote isolated function updateSupplierAddress(string bookId, string supplierId, string 'type, UpdateAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing supplier address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteSupplierAddress(string bookId, string supplierId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/addresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing supplier address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The address type by name or id. 
    # + payload - Details of the supplier's address to change. 
    # + return - The result of the update. 
    remote isolated function patchSupplierAddress(string bookId, string supplierId, string 'type, AddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets the supplier's linked contacts.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of supplier's contact per page. 
    # + return - The requested supplier's linked contacts. 
    remote isolated function getSuppliersLinkedContacts(string bookId, string supplierId, int page = 1, int perPage = 0) returns Contacts|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/contacts`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new contact and links it to the supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + payload - Details of the new contact. 
    # + return - The id of the contact that has been created. 
    remote isolated function addNewContactToSupplier(string bookId, string supplierId, LinkedContactInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a supplier's linked contact details.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + contactId - The supplier's linked contact id. 
    # + return - The requested supplier's linked contact. 
    remote isolated function getSuppliersLinkedContact(string bookId, string supplierId, string contactId) returns Contact|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/contacts/${contactId}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Links an existing contact to a supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + contactId - The contact's id to be linked to the supplier. 
    # + return - The result of linking an existing contact to a supplier. 
    remote isolated function linkExistingContactToSupplier(string bookId, string supplierId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/contacts/${contactId}/link`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unlinks a supplier's linked contact.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + contactId - The supplier's linked contact's id. 
    # + return - The result of the unlink procedure. 
    remote isolated function unlinkSupplierLinkedContact(string bookId, string supplierId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/contacts/${contactId}/unlink`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets a supplier's electronic addresses.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + return - The requested supplier's electronic addresses. 
    remote isolated function getSupplierElectronicAddresses(string bookId, string supplierId) returns ElectronicAddresses|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/electronicAddresses`;
        ElectronicAddresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new electronic address to an existing supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + payload - The details of the electronic address to add. 
    # + return - The id and name of the electronic address type that has been created. 
    remote isolated function createSupplierElectronicAddress(string bookId, string supplierId, ElectronicAddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/electronicAddresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a supplier's electronic address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The electronic address type as either name or id. 
    # + return - The supplier's requested electronic address. 
    remote isolated function getSupplierElectronicAddress(string bookId, string supplierId, string 'type) returns ElectronicAddress|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/electronicAddresses/${'type}`;
        ElectronicAddress response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing supplier electronic address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The electronic address's type by name or id. 
    # + payload - Details of the supplier's electronic address to update. 
    # + return - The result of the update. 
    remote isolated function updateSupplierElectronicAddress(string bookId, string supplierId, string 'type, UpdateElectronicAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing supplier's electronic address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The electronic address type's id or name. 
    # + return - The result of the deletion. 
    remote isolated function deleteElectronicAddress(string bookId, string supplierId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/electronicAddresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing supplier electronic address.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The electronic address's type by name or id. 
    # + payload - Details of the supplier's electronic address to update. 
    # + return - The result of the update. 
    remote isolated function patchSupplierElectronicAddress(string bookId, string supplierId, string 'type, ElectronicAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a supplier's phone numbers.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + return - The requested supplier's phone numbers. 
    remote isolated function getSupplierPhoneNumbers(string bookId, string supplierId) returns PhoneNumbers|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/phoneNumbers`;
        PhoneNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new phone number to an existing supplier.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + payload - Details of the phone number to add. 
    # + return - The id and name of the phone number type that has been created. 
    remote isolated function createSupplierPhoneNumber(string bookId, string supplierId, PhoneNumberInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/phoneNumbers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a supplier's phone number.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The phone number's type by name or id. 
    # + return - The supplier's specific phone number. 
    remote isolated function getSupplierPhoneNumber(string bookId, string supplierId, string 'type) returns PhoneNumber|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/phoneNumbers/${'type}`;
        PhoneNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of an existing supplier phone number.
    #
    # + bookId - The book's id. 
    # + supplierId - The supplier's id. 
    # + 'type - The phone number type by name or id. 
    # + payload - Details of the phone number to change. 
    # + return - The result of the update. 
    remote isolated function patchSupplierPhoneNumber(string bookId, string supplierId, string 'type, PhoneNumberPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/suppliers/${supplierId}/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of super funds.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A paged list of super funds for the specified book. 
    remote isolated function getSuperfunds(string bookId, int page = 1, int perPage = 0) returns Superfunds|error {
        string resourcePath = string `/${bookId}/superfunds`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Superfunds response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new super fund.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new super fund. 
    # + return - The id of the super fund that has been created. 
    remote isolated function createSuperfund(string bookId, SuperfundInput payload) returns IdNameResponse|error {
        string resourcePath = string `/${bookId}/superfunds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdNameResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + return - The requested super fund. 
    remote isolated function getSuperfund(string bookId, string superfundId) returns Superfund|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}`;
        Superfund response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + payload - Details of the updated super fund. 
    # + return - The result of the update. 
    remote isolated function updateSuperfund(string bookId, string superfundId, SuperfundInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteSuperfund(string bookId, string superfundId) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + payload - Details of the updated super fund to change. 
    # + return - The result of the update. 
    remote isolated function patchSuperfund(string bookId, string superfundId, SuperfundPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a super fund's linked contacts.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super fund's contact per page. 
    # + return - A paged list of super fund's linked contacts for the specified book. 
    remote isolated function getSuperfundsLinkedContacts(string bookId, string superfundId, int page = 1, int perPage = 0) returns Contacts|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/contacts`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new contact and links it to the super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + payload - Details of the new contact. 
    # + return - The id of the contact that has been created. 
    remote isolated function addNewContactToSuperfund(string bookId, string superfundId, LinkedContactInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a super fund's linked contact.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + contactId - The super fund's linked contact's id. 
    # + return - A super fund's linked contact for the specified book. 
    remote isolated function getSuperfundsLinkedContact(string bookId, string superfundId, string contactId) returns Contact|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/contacts/${contactId}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Links an existing contact to a specified super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + contactId - The contact's id to be linked to the super fund. 
    # + return - The result of linking an existing contact to a super fund. 
    remote isolated function linkExistingContactToSuperfund(string bookId, string superfundId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/contacts/${contactId}/link`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unlinks a specified super fund's linked contact from that super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + contactId - The super fund's linked contact's id. 
    # + return - The result of the unlink procedure. 
    remote isolated function unlinkSuperfundsLinkedContact(string bookId, string superfundId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/contacts/${contactId}/unlink`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets a super fund's phone numbers.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + return - The requested super fund's phone numbers. 
    remote isolated function getSuperfundPhoneNumbers(string bookId, string superfundId) returns PhoneNumbers|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/phoneNumbers`;
        PhoneNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new phone number to an existing super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + payload - Details of the phone number to add. 
    # + return - The id and name of the phone number type that has been created. 
    remote isolated function createSuperfundPhoneNumber(string bookId, string superfundId, PhoneNumberInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/phoneNumbers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a super fund's phone number.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The phone number's type by name or id. 
    # + return - The super fund's specific phone number. 
    remote isolated function getSuperfundPhoneNumber(string bookId, string superfundId, string 'type) returns PhoneNumber|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/phoneNumbers/${'type}`;
        PhoneNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of an existing super fund phone number.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The phone number's type by name or id. 
    # + payload - Details of the phone number to change. 
    # + return - The result of the update. 
    remote isolated function patchSuperfundPhoneNumber(string bookId, string superfundId, string 'type, PhoneNumberPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a super fund's addresses.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + return - The requested super fund's addresses. 
    remote isolated function getSuperfundAddresses(string bookId, string superfundId) returns Addresses|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/addresses`;
        Addresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new address to an existing super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + payload - The details of the address to add. 
    # + return - The id and name of the address type that has been created. 
    remote isolated function createSuperfundAddress(string bookId, string superfundId, AddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a super fund's address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The type of address by name or id. 
    # + return - The super fund's requested address. 
    remote isolated function getSuperfundAddress(string bookId, string superfundId, string 'type) returns Address|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/addresses/${'type}`;
        Address response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing super fund address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The address's type by name or id. 
    # + payload - The address. 
    # + return - The result of the update. 
    remote isolated function updateSuperfundAddress(string bookId, string superfundId, string 'type, UpdateAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing super fund address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteSuperfundAddress(string bookId, string superfundId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/addresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing super fund address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The address's type by name or id. 
    # + payload - Details of the super fund's address to change. 
    # + return - The result of the update. 
    remote isolated function patchSuperfundAddress(string bookId, string superfundId, string 'type, AddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a super fund's electronic addresses.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + return - The requested super fund's electronic addresses. 
    remote isolated function getSuperfundElectronicAddresses(string bookId, string superfundId) returns ElectronicAddresses|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/electronicAddresses`;
        ElectronicAddresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new electronic address to an existing super fund.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + payload - The details of the electronic address to add. 
    # + return - The id and name of the electronic address type that has been created. 
    remote isolated function createSuperfundElectronicAddress(string bookId, string superfundId, ElectronicAddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/electronicAddresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a super fund's electronic address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The electronic address's type by name or id. 
    # + return - The super fund's requested electronic address. 
    remote isolated function getSuperfundElectronicAddress(string bookId, string superfundId, string 'type) returns ElectronicAddress|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/electronicAddresses/${'type}`;
        ElectronicAddress response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing super fund electronic address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The electronic address's type by name or id. 
    # + payload - Details of the super fund's electronic address to update. 
    # + return - The result of the update. 
    remote isolated function updateSuperfundElectronicAddress(string bookId, string superfundId, string 'type, UpdateElectronicAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing super fund electronic address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The electronic address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteSuperfundPhoneNumber(string bookId, string superfundId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/electronicAddresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing super fund electronic address.
    #
    # + bookId - The book's id. 
    # + superfundId - The super fund's id. 
    # + 'type - The electronic address's type by name or id. 
    # + payload - Details of the super fund's electronic address to update. 
    # + return - The result of the update. 
    remote isolated function patchSuperfundElectronicAddress(string bookId, string superfundId, string 'type, ElectronicAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/superfunds/${superfundId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of phone types.
    #
    # + bookId - The book's id. 
    # + return - A list of phone types for the specified book. 
    remote isolated function getPhoneTypes(string bookId) returns PhoneTypes|error {
        string resourcePath = string `/${bookId}/phonetypes`;
        PhoneTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new phone type.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new phone type. 
    # + return - The id of the phone type that has been created. 
    remote isolated function createPhoneType(string bookId, PhoneTypeInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/phonetypes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a phone type.
    #
    # + bookId - The book's id. 
    # + phoneTypeId - The phone type's id. 
    # + return - The requested phone type. 
    remote isolated function getPhoneType(string bookId, string phoneTypeId) returns PhoneType|error {
        string resourcePath = string `/${bookId}/phonetypes/${phoneTypeId}`;
        PhoneType response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing phone type.
    #
    # + bookId - The book's id. 
    # + phoneTypeId - The phone type's id. 
    # + payload - Details of the updated phone type. 
    # + return - The result of the update. 
    remote isolated function updatePhoneType(string bookId, string phoneTypeId, PhoneTypeInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/phonetypes/${phoneTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing phone type.
    #
    # + bookId - The book's id. 
    # + phoneTypeId - The phone type's id. 
    # + return - The result of the deletion. 
    remote isolated function deletePhoneType(string bookId, string phoneTypeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/phonetypes/${phoneTypeId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing phone type.
    #
    # + bookId - The book's id. 
    # + phoneTypeId - The phone type's id. 
    # + payload - Details of the updated phone type. 
    # + return - The result of the update. 
    remote isolated function patchPhoneType(string bookId, string phoneTypeId, PhoneTypePatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/phonetypes/${phoneTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of address types.
    #
    # + bookId - The book's id. 
    # + return - A list of address types for the specified book. 
    remote isolated function getAddressTypes(string bookId) returns AddressTypes|error {
        string resourcePath = string `/${bookId}/addresstypes`;
        AddressTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new address type.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new address type. 
    # + return - The id of the address type that has been created. 
    remote isolated function createAddressType(string bookId, AddressTypeInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/addresstypes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an address type.
    #
    # + bookId - The book's id. 
    # + addressTypeId - The address type's id. 
    # + return - The requested address type. 
    remote isolated function getAddressType(string bookId, string addressTypeId) returns AddressType|error {
        string resourcePath = string `/${bookId}/addresstypes/${addressTypeId}`;
        AddressType response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing address type.
    #
    # + bookId - The book's id. 
    # + addressTypeId - The address type's id. 
    # + payload - Details of the updated address type. 
    # + return - The result of the update. 
    remote isolated function updateAddressType(string bookId, string addressTypeId, AddressTypeInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/addresstypes/${addressTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing address type.
    #
    # + bookId - The book's id. 
    # + addressTypeId - The address type's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteAddressType(string bookId, string addressTypeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/addresstypes/${addressTypeId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing address type.
    #
    # + bookId - The book's id. 
    # + addressTypeId - The address type's id. 
    # + payload - Details of the updated address type. 
    # + return - The result of the update. 
    remote isolated function patchAddressType(string bookId, string addressTypeId, AddressTypePatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/addresstypes/${addressTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of contacts.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of contacts per page. 
    # + return - A paged list of contacts for the specified book. 
    remote isolated function getContacts(string bookId, int page = 1, int perPage = 0) returns Contacts|error {
        string resourcePath = string `/${bookId}/contacts`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new contact.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new contact. 
    # + return - The id of the contact that has been created. 
    remote isolated function createContact(string bookId, ContactInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a contact.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + return - The requested contact. 
    remote isolated function getContact(string bookId, string contactId) returns Contact|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing contact.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + payload - Details of the updated contact. 
    # + return - The result of the update. 
    remote isolated function updateContact(string bookId, string contactId, ContactInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing contact.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteContact(string bookId, string contactId) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing contact.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + payload - Details of the contact to change. 
    # + return - The result of the update. 
    remote isolated function patchContact(string bookId, string contactId, ContactPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a contact's electronic addresses.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + return - A list of contact's electronic addresses for the specified book. 
    remote isolated function getContactElectronicAddresses(string bookId, string contactId) returns ElectronicAddresses|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/electronicAddresses`;
        ElectronicAddresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new electronic address to an existing contact.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + payload - Details of the electronic address to add. 
    # + return - The id and name of the contact electronic address type that has been created. 
    remote isolated function createContactElectronicAddress(string bookId, string contactId, ElectronicAddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/electronicAddresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a contact's electronic address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The electronic address's type by name or id. 
    # + return - A contact's electronic address. 
    remote isolated function getContactElectronicAddress(string bookId, string contactId, string 'type) returns ElectronicAddress|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/electronicAddresses/${'type}`;
        ElectronicAddress response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing contact electronic address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The electronic address's type by name or id. 
    # + payload - The electronic address. 
    # + return - The result of the deletion. 
    remote isolated function updateContactElectronicAddress(string bookId, string contactId, string 'type, UpdateElectronicAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing contact electronic address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The electronic address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteContactElectronicAddress(string bookId, string contactId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/electronicAddresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing contact electronic address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The electronic address's type by name or id 
    # + payload - Details of the contact electronic address to update. 
    # + return - The result of the update. 
    remote isolated function patchContactElectronicAddress(string bookId, string contactId, string 'type, ElectronicAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a contact's phone numbers.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + return - A list of contact's phone numbers. 
    remote isolated function getContactPhoneNumbers(string bookId, string contactId) returns PhoneNumbers|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/phoneNumbers`;
        PhoneNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new phone number to an existing contact.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + payload - Details of the phone number to add. 
    # + return - The id and name of the contact phone number type that has been created. 
    remote isolated function createContactPhoneNumber(string bookId, string contactId, PhoneNumberInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/phoneNumbers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a contact's phone number.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The phone number's type by name or id. 
    # + return - The contact's specific phone number. 
    remote isolated function getContactPhoneNumber(string bookId, string contactId, string 'type) returns PhoneNumber|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/phoneNumbers/${'type}`;
        PhoneNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing contact phone number.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The phone number's type by name or id. 
    # + payload - Details of the phone number to update. 
    # + return - The result of the update. 
    remote isolated function updateContactPhoneNumber(string bookId, string contactId, string 'type, UpdatePhoneNumberInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an existing contact phone number.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The phone number's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteContactPhoneNumber(string bookId, string contactId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/phoneNumbers/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing contact phone number.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The phone number's type by name or id. 
    # + payload - Details of the contact phone number to update. 
    # + return - The result of the update. 
    remote isolated function patchContactPhoneNumber(string bookId, string contactId, string 'type, PhoneNumberPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a contact's addresses.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + return - A list of contact's addresses for the specified book. 
    remote isolated function getContactAddresses(string bookId, string contactId) returns Addresses|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/addresses`;
        Addresses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new contact adress.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + payload - Details of the new address. 
    # + return - The id of the address that has been created. 
    remote isolated function createContactAddress(string bookId, string contactId, AddressInput payload) returns TypeResponse|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a contact's address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The address's type by name or id. 
    # + return - A contact's address. 
    remote isolated function getContactAddress(string bookId, string contactId, string 'type) returns Address|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/addresses/${'type}`;
        Address response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing contact address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The address's type by name or id. 
    # + payload - The address. 
    # + return - The result of the deletion. 
    remote isolated function updateContactAddress(string bookId, string contactId, string 'type, UpdateAddressInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing contact address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The address's type by name or id. 
    # + return - The result of the deletion. 
    remote isolated function deleteContactAddress(string bookId, string contactId, string 'type) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/addresses/${'type}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing contact address.
    #
    # + bookId - The book's id. 
    # + contactId - The contact's id. 
    # + 'type - The address's type by name or id. 
    # + payload - Details of the contact address to update. 
    # + return - The result of the update. 
    remote isolated function patchContactAddress(string bookId, string contactId, string 'type, AddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/contacts/${contactId}/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of electronic address types.
    #
    # + bookId - The book's id. 
    # + return - A list of electronic address types for the specified book. 
    remote isolated function getElectronicAddressTypes(string bookId) returns ElectronicAddressTypes|error {
        string resourcePath = string `/${bookId}/electronicaddresstypes`;
        ElectronicAddressTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new electronic address type.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new electronic address type. 
    # + return - The id of the electronic address type that has been created. 
    remote isolated function createElectronicAddressType(string bookId, ElectronicAddressTypeInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/electronicaddresstypes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an electronic address type.
    #
    # + bookId - The book's id. 
    # + electronicAddressTypeId - The electronic address type's id. 
    # + return - The requested electronic address type. 
    remote isolated function getElectronicAddressType(string bookId, string electronicAddressTypeId) returns ElectronicAddressType|error {
        string resourcePath = string `/${bookId}/electronicaddresstypes/${electronicAddressTypeId}`;
        ElectronicAddressType response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing electronic address type.
    #
    # + bookId - The book's id. 
    # + electronicAddressTypeId - The electronic address type's id. 
    # + payload - Details of the updated electronic address type. 
    # + return - The result of the update. 
    remote isolated function updateElectronicAddressType(string bookId, string electronicAddressTypeId, ElectronicAddressTypeInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/electronicaddresstypes/${electronicAddressTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing electronic address type.
    #
    # + bookId - The book's id. 
    # + electronicAddressTypeId - The electronic address type's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteElectronicAddressType(string bookId, string electronicAddressTypeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/electronicaddresstypes/${electronicAddressTypeId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing electronic address type.
    #
    # + bookId - The book's id. 
    # + electronicAddressTypeId - The electronic address type's id. 
    # + payload - Details of the updated electronic address type. 
    # + return - The result of the update. 
    remote isolated function patchElectronicAddressType(string bookId, string electronicAddressTypeId, ElectronicAddressTypePatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/electronicaddresstypes/${electronicAddressTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of ledger accounts.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of accounts per page. 
    # + return - A paged list of ledger accounts for the specified book. 
    remote isolated function getLedgerAccounts(string bookId, int page = 1, int perPage = 0) returns LedgerAccounts|error {
        string resourcePath = string `/${bookId}/ledgeraccounts`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LedgerAccounts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new ledger account.
    #
    # + bookId - The book's id. 
    # + payload - The account to create. 
    # + return - The id of the account that has been created. 
    remote isolated function createLedgerAccount(string bookId, LedgerAccountInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/ledgeraccounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a ledger account.
    #
    # + bookId - The book's id. 
    # + accountId - The ledger account's id. 
    # + return - The requested ledger account. 
    remote isolated function getLedgerAccount(string bookId, string accountId) returns LedgerAccount|error {
        string resourcePath = string `/${bookId}/ledgeraccounts/${accountId}`;
        LedgerAccount response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing ledger account.
    #
    # + bookId - The book's id. 
    # + ledgerAccountId - The ledger account's id. 
    # + payload - Details of the updated ledger account. 
    # + return - The result of the update. 
    remote isolated function updateLedgerAccount(string bookId, string ledgerAccountId, LedgerAccountInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/ledgeraccounts/${ledgerAccountId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing ledger account.
    #
    # + bookId - The book's id. 
    # + ledgerAccountId - The ledger account's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteLedgerAccount(string bookId, string ledgerAccountId) returns http:Response|error {
        string resourcePath = string `/${bookId}/ledgeraccounts/${ledgerAccountId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing ledger account.
    #
    # + bookId - The book's id. 
    # + ledgerAccountId - The ledger account's id. 
    # + payload - Details of the updated ledger account. 
    # + return - The result of the update. 
    remote isolated function patchLedgerAccount(string bookId, string ledgerAccountId, LedgerAccountPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/ledgeraccounts/${ledgerAccountId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of financial institutions.
    #
    # + bookId - The book's id. 
    # + return - A list of financial institutions. 
    remote isolated function getFinancialInstitutions(string bookId) returns FinancialInstitutions|error {
        string resourcePath = string `/${bookId}/banking/financialinstitutions`;
        FinancialInstitutions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of employees.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of employees per page. 
    # + return - A paged list of employees for the specified book. 
    remote isolated function getEmployees(string bookId, int page = 1, int perPage = 0) returns Employees|error {
        string resourcePath = string `/${bookId}/employees`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Employees response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new employee.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new employee. 
    # + return - The id of the employee that has been created. 
    remote isolated function createEmployee(string bookId, EmployeeInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/employees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an employee.
    #
    # + bookId - The book's id. 
    # + employeeId - The employee's id. 
    # + return - The requested contact. 
    remote isolated function getEmployee(string bookId, string employeeId) returns Employee|error {
        string resourcePath = string `/${bookId}/employees/${employeeId}`;
        Employee response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing employee.
    #
    # + bookId - The book's id. 
    # + employeeId - The employee's id. 
    # + payload - Details of the updated employee. 
    # + return - The result of the update. 
    remote isolated function updateEmployee(string bookId, string employeeId, EmployeeInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/employees/${employeeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing employee.
    #
    # + bookId - The book's id. 
    # + employeeId - The employee's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteEmployee(string bookId, string employeeId) returns http:Response|error {
        string resourcePath = string `/${bookId}/employees/${employeeId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing employee.
    #
    # + bookId - The book's id. 
    # + employeeId - The employee's id. 
    # + payload - Details of the employee to change. 
    # + return - The result of the update. 
    remote isolated function patchEmployee(string bookId, string employeeId, EmployeePatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/employees/${employeeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of expense claims.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of expense claims per page. 
    # + return - A paged list of expense claims for the specified book. 
    remote isolated function getExpenseClaims(string bookId, int page = 1, int perPage = 0) returns ExpenseClaims|error {
        string resourcePath = string `/${bookId}/expenseclaims`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExpenseClaims response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new expense claim.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new expense claim. 
    # + return - The id of the expense claim that has been created. 
    remote isolated function createExpenseClaim(string bookId, ExpenseClaimInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/expenseclaims`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + format - The format to use, e.g. pdf. 
    # + return - The requested expense claim. 
    remote isolated function getExpenseClaim(string bookId, string expenseClaimId, string? format = ()) returns ExpenseClaim|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExpenseClaim response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + payload - Details of the updated expense claim. 
    # + return - The result of the update. 
    remote isolated function updateExpensClaim(string bookId, string expenseClaimId, ExpenseClaimInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteExpenseClaim(string bookId, string expenseClaimId) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchExpenseClaim(string bookId, string expenseClaimId, ExpenseClaimPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Creates a new line item within an existing expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + payload - Details of the new line item. 
    # + return - The id of the line item that has been created. 
    remote isolated function addLineItemToExpenseClaim(string bookId, string expenseClaimId, ExpenseClaimLineItemInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineItems`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates an existing line item within an existing expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + lineItemId - The id of the line item to update. 
    # + payload - Details of the updated line item. 
    # + return - The result of the update. 
    remote isolated function updateExpenseClaimLineItem(string bookId, string expenseClaimId, string lineItemId, ExpenseClaimLineItemInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineitems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing line item.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + lineItemId - The id of the line item to delete. 
    # + return - The result of the deletion. 
    remote isolated function deleteExpenseClaimLineItem(string bookId, string expenseClaimId, string lineItemId) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineitems/${lineItemId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing line item within an existing expense claim.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + lineItemId - The id of the line item to update. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchExpenseClaimLineItem(string bookId, string expenseClaimId, string lineItemId, ExpenseClaimLineItemPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineitems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Downloads a document that is attached to an expense claim line item.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + lineItemId - The line item's id. 
    # + attachmentId - The id of the attachment to download. 
    # + return - The contents of the document and its file name in the X-File-Name header. 
    remote isolated function downloadAttachment(string bookId, string expenseClaimId, string lineItemId, string attachmentId) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineitems/${lineItemId}/attachments/${attachmentId}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an attachment.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + lineItemId - The id of the line item to delete the document from. 
    # + attachmentId - The attachment's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteAttachment(string bookId, string expenseClaimId, string lineItemId, string attachmentId) returns http:Response|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineitems/${lineItemId}/attachments/${attachmentId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Attaches one or more documents to an expense claim line item.
    #
    # + bookId - The book's id. 
    # + expenseClaimId - The expense claim's id. 
    # + lineItemId - The id of the line item to attach the document(s) to. 
    # + fileName - The name of the file when passing a single document in the body of the request. 
    # + return - A list of document attachment responses. 
    remote isolated function addAttachment(string bookId, string expenseClaimId, string lineItemId, string? fileName = ()) returns AddAttachmentResponses|error {
        string resourcePath = string `/${bookId}/expenseclaims/${expenseClaimId}/lineitems/${lineItemId}/attachments`;
        map<anydata> queryParam = {"fileName": fileName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        AddAttachmentResponses response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Reckon One API heartbeat.
    #
    # + return - The status of the API. 
    remote isolated function getHeartbeat() returns HeartbeatStatus|error {
        string resourcePath = string `/heartbeat`;
        HeartbeatStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of classifications.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of classifications per page. 
    # + return - A paged list of classifications for the specified book. 
    remote isolated function getClassifications(string bookId, int page = 1, int perPage = 0) returns Classifications|error {
        string resourcePath = string `/${bookId}/classifications`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Classifications response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new classification.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new classification. 
    # + return - The id of the classification that has been created. 
    remote isolated function createClassification(string bookId, ClassificationInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/classifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a classification.
    #
    # + bookId - The book's id. 
    # + classificationId - The classification's id. 
    # + return - The requested classification. 
    remote isolated function getClassification(string bookId, string classificationId) returns Classification|error {
        string resourcePath = string `/${bookId}/classifications/${classificationId}`;
        Classification response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing classification.
    #
    # + bookId - The book's id. 
    # + classificationId - The classification's id. 
    # + payload - Details of the updated classification. 
    # + return - The result of the update. 
    remote isolated function updateClassification(string bookId, string classificationId, ClassificationInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/classifications/${classificationId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing classification.
    #
    # + bookId - The book's id. 
    # + classificationId - The classification's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteClassification(string bookId, string classificationId) returns http:Response|error {
        string resourcePath = string `/${bookId}/classifications/${classificationId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing classification.
    #
    # + bookId - The book's id. 
    # + classificationId - The classification's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchClassification(string bookId, string classificationId, ClassificationPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/classifications/${classificationId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of payment terms.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of payment term per page. 
    # + return - A paged list of payment terms for the specified book. 
    remote isolated function getPaymentTerms(string bookId, int page = 1, int perPage = 0) returns PaymentTerms|error {
        string resourcePath = string `/${bookId}/terms`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaymentTerms response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new payment term.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new payment term. 
    # + return - The id of the payment term that has been created. 
    remote isolated function createPaymentTerm(string bookId, PaymentTermInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/terms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a payment term.
    #
    # + bookId - The book's id. 
    # + termId - The term's id. 
    # + return - The requested payment term. 
    remote isolated function getPaymentTerm(string bookId, string termId) returns PaymentTerm|error {
        string resourcePath = string `/${bookId}/terms/${termId}`;
        PaymentTerm response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing payment term.
    #
    # + bookId - The book's id. 
    # + termId - The term's id. 
    # + payload - Details of the updated payment term. 
    # + return - The result of the update. 
    remote isolated function updatePaymentTerm(string bookId, string termId, PaymentTermInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/terms/${termId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing payment term.
    #
    # + bookId - The book's id. 
    # + termId - The term's id. 
    # + return - The result of the deletion. 
    remote isolated function deletePaymentTerm(string bookId, string termId) returns http:Response|error {
        string resourcePath = string `/${bookId}/terms/${termId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates an existing payment term.
    #
    # + bookId - The book's id. 
    # + termId - The term's id. 
    # + payload - Details of the updated payment term. 
    # + return - The result of the update. 
    remote isolated function patchPaymentTerm(string bookId, string termId, PaymentTermPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/terms/${termId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a calculated due date from a specified base date.
    #
    # + bookId - The book's id. 
    # + termId - The term's id. 
    # + baseDate - A base date 
    # + return - A calculated due date. 
    remote isolated function getPaymentTermDueDate(string bookId, string termId, string baseDate) returns PaymentTermDueDate|error {
        string resourcePath = string `/${bookId}/terms/${termId}/duedate/basedate/${baseDate}`;
        PaymentTermDueDate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of invoices.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of invoices per page. 
    # + return - A paged list of invoices for the specified book. 
    remote isolated function getInvoices(string bookId, int page = 1, int perPage = 0) returns Invoices|error {
        string resourcePath = string `/${bookId}/invoices`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Invoices response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new invoice.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new invoice. 
    # + return - The id of the invoice that has been created. 
    remote isolated function createInvoice(string bookId, InvoiceInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/invoices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + format - The format to use, e.g. pdf. 
    # + return - The requested invoice. 
    remote isolated function getInvoice(string bookId, string invoiceId, string? format = ()) returns Invoice|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Invoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + payload - Details of the updated invoice. 
    # + return - The result of the update. 
    remote isolated function updateInvoice(string bookId, string invoiceId, InvoiceInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteInvoice(string bookId, string invoiceId) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchInvoice(string bookId, string invoiceId, InvoicePatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a summary of a book's invoices.
    #
    # + bookId - The book's id. 
    # + baseDate - The base date to use when checking for overdue invoices. 
    # + return - A summary of a book's invoices. 
    remote isolated function getInvoiceSummary(string bookId, string? baseDate = ()) returns InvoicesSummary|error {
        string resourcePath = string `/${bookId}/invoices/summary`;
        map<anydata> queryParam = {"baseDate": baseDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InvoicesSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a summary of a book's invoices for a given customer.
    #
    # + bookId - The book's id. 
    # + customerId - The customer id to filter on. 
    # + baseDate - The base date to use when checking for overdue invoices. 
    # + return - A summary of a book's invoices for a given customer. 
    remote isolated function getCustomerInvoiceSummary(string bookId, string customerId, string? baseDate = ()) returns InvoicesSummary|error {
        string resourcePath = string `/${bookId}/invoices/summary/${customerId}`;
        map<anydata> queryParam = {"baseDate": baseDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InvoicesSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new invoice from an estimate.
    #
    # + bookId - The book's id. 
    # + payload - Details to convert into an invoice. 
    # + return - The id of the invoice that has been created. 
    remote isolated function convertInvoiceFrom(string bookId, InvoiceConvertFromInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/invoices/convertfrom`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unlinks an existing transaction from an invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + linkId - The link's id. 
    # + return - The result of the request to unlink the transaction. 
    remote isolated function unlinkInvoiceTransaction(string bookId, string invoiceId, string linkId) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/transactionlinks/${linkId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets an email template populated with details from the specified invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + return - The populated email template. 
    remote isolated function getPopulatedEmail(string bookId, string invoiceId) returns Email|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/email`;
        Email response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Emails an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + payload - Details of an email to send. 
    # + return - The invoice sent. 
    remote isolated function emailInvoice(string bookId, string invoiceId, EmailInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/email`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Marks an existing invoice as sent.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + return - The result of the request to mark the invoice as sent. 
    remote isolated function markInvoiceEmailAsSent(string bookId, string invoiceId) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/email/markAsSent`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Marks an existing invoice as unsent.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + return - The result of the request to mark the invoice as unsent. 
    remote isolated function markInvoiceEmailAsUnsent(string bookId, string invoiceId) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/email/markAsUnsent`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets a line item from an invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + lineItemId - The line item's id. 
    # + return - The line item. 
    remote isolated function getInvoiceLineItem(string bookId, string invoiceId, string lineItemId) returns InvoiceLineItem|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/lineItems/${lineItemId}`;
        InvoiceLineItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing line item within an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + lineItemId - The line item's id. 
    # + payload - Details of the line item. 
    # + return - The result of the update. 
    remote isolated function updateInvoiceLineItem(string bookId, string invoiceId, string lineItemId, InvoiceLineItemInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/lineItems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Creates a new line item within an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + payload - Details of the new line item. 
    # + return - The id of the line item that has been created. 
    remote isolated function addLineItemToInvoice(string bookId, string invoiceId, InvoiceLineItemInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/lineItems`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes an existing line item.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + lineItemId - The id of the line item to delete. 
    # + return - The result of the deletion. 
    remote isolated function deleteInvoiceLineItem(string bookId, string invoiceId, string lineItemId) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/lineitems/${lineItemId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing line item within an existing invoice.
    #
    # + bookId - The book's id. 
    # + invoiceId - The invoice's id. 
    # + lineItemId - The id of the line item to update. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchInvoiceLineItem(string bookId, string invoiceId, string lineItemId, InvoiceLineItemPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/invoices/${invoiceId}/lineitems/${lineItemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a recurring invoice template.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The requested recurring invoice template. 
    remote isolated function getRecurringInvoiceTemplate(string bookId, string templateId) returns RecurringInvoiceTemplate|error {
        string resourcePath = string `/${bookId}/invoices/recurringTemplates/${templateId}`;
        RecurringInvoiceTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of projects.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of projects per page. 
    # + return - A paged list of projects for the specified book. 
    remote isolated function getProjects(string bookId, int page = 1, int perPage = 0) returns Projects|error {
        string resourcePath = string `/${bookId}/projects`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Projects response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new project.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new project. 
    # + return - The id of the project that has been created. 
    remote isolated function createProject(string bookId, ProjectInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/projects`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + return - The requested project. 
    remote isolated function getProject(string bookId, string projectId) returns Project|error {
        string resourcePath = string `/${bookId}/projects/${projectId}`;
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + payload - Details of the updated project. 
    # + return - The result of the update. 
    remote isolated function updateProject(string bookId, string projectId, ProjectInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteProject(string bookId, string projectId) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + payload - The project's details being altered. 
    # + return - The result of the update. 
    remote isolated function patchProject(string bookId, string projectId, ProjectPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Deletes an existing project item.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + lineId - The id of the project item to delete. 
    # + return - The result of the deletion. 
    remote isolated function deleteProjectItem(string bookId, string projectId, string lineId) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}/items/${lineId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing project item within an existing project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + lineId - The project item's id. 
    # + payload - The project item's details being altered. 
    # + return - The result of the update. 
    remote isolated function patchProjectItem(string bookId, string projectId, string lineId, ProjectItemPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}/items/${lineId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Deletes an existing project customer.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + lineId - The id of the project customer to delete. 
    # + return - The result of the deletion. 
    remote isolated function deleteProjectCustomer(string bookId, string projectId, string lineId) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}/customers/${lineId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing project customer within an existing project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + lineId - The project customer's id. 
    # + payload - The project customer's details being altered. 
    # + return - The result of the update. 
    remote isolated function patchProjectCustomer(string bookId, string projectId, string lineId, ProjectCustomerPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}/customers/${lineId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Deletes an existing project supplier.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + lineId - The id of the project supplier to delete. 
    # + return - The result of the deletion. 
    remote isolated function deleteProjectSupplier(string bookId, string projectId, string lineId) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}/suppliers/${lineId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing project supplier within an existing project.
    #
    # + bookId - The book's id. 
    # + projectId - The project's id. 
    # + lineId - The project suppliers's id. 
    # + payload - The project suppliers's details being altered. 
    # + return - The result of the update. 
    remote isolated function patchProjectSupplier(string bookId, string projectId, string lineId, ProjectSupplierPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/projects/${projectId}/suppliers/${lineId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get a book's general settings.
    #
    # + bookId - The book's id. 
    # + return - The general settings for the specified book. 
    remote isolated function getSettings(string bookId) returns BookSettings|error {
        string resourcePath = string `/${bookId}/settings`;
        BookSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's settings.
    #
    # + bookId - The book's id. 
    # + payload - The book settings being altered. 
    # + return - The result of the update. 
    remote isolated function patchSettings(string bookId, BookSettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Updates selected fields of an address in a book's settings.
    #
    # + bookId - The book's id. 
    # + 'type - The type of address. This can either be `legal`, `physical` or the address type id. 
    # + payload - The address being altered. 
    # + return - The result of the update. 
    remote isolated function patchSettingsAddress(string bookId, string 'type, BookAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/addresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Updates selected fields of a contact phone number in a book's settings.
    #
    # + bookId - The book's id. 
    # + 'type - The type of phone number. This can either be `phone`, `mobile`, `fax` or the phone number type id. 
    # + payload - The phone number being altered. 
    # + return - The result of the update. 
    remote isolated function patchSettingsContactPhoneNumber(string bookId, string 'type, BookPhoneNumberPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/contact/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Updates selected fields of a contact electronic address in a book's settings.
    #
    # + bookId - The book's id. 
    # + 'type - The type of electronic address. This can either be `email` or `web`. 
    # + payload - The electronic address being altered. 
    # + return - The result of the update. 
    remote isolated function patchSettingsContactElectronicAddress(string bookId, string 'type, BookElectronicAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/contact/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get a book's tax settings.
    #
    # + bookId - The book's id. 
    # + return - The tax settings for the specified book. 
    remote isolated function getTaxSettings(string bookId) returns TaxSettings|error {
        string resourcePath = string `/${bookId}/settings/tax`;
        TaxSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's tax settings.
    #
    # + bookId - The book's id. 
    # + payload - The book's tax settings being updated. 
    # + return - The result of the update. 
    remote isolated function patchTaxSettings(string bookId, TaxSettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/tax`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a book's invoice settings.
    #
    # + bookId - The book's id. 
    # + return - The invoice settings for the specified book. 
    remote isolated function getInvoiceSettings(string bookId) returns InvoiceSettings|error {
        string resourcePath = string `/${bookId}/settings/invoice`;
        InvoiceSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's invoice settings.
    #
    # + bookId - The book's id. 
    # + payload - The book's invoice settings to update. 
    # + return - The result of the update. 
    remote isolated function patchInvoiceSettings(string bookId, InvoiceSettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/invoice`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a book's credit note settings.
    #
    # + bookId - The book's id. 
    # + return - The credit note settings for the specified book. 
    remote isolated function getCreditNoteSettings(string bookId) returns CreditNoteSettings|error {
        string resourcePath = string `/${bookId}/settings/creditNote`;
        CreditNoteSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's credit note settings.
    #
    # + bookId - The book's id. 
    # + payload - The book's credit note settings to update. 
    # + return - The result of the update. 
    remote isolated function patchCreditNoteSettings(string bookId, CreditNoteSettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/creditNote`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a book's receipt settings.
    #
    # + bookId - The book's id. 
    # + return - The receipt settings for the specified book. 
    remote isolated function getReceiptSettings(string bookId) returns ReceiptSettings|error {
        string resourcePath = string `/${bookId}/settings/receipt`;
        ReceiptSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's receipt settings.
    #
    # + bookId - The book's id. 
    # + payload - The book's receipt settings to update. 
    # + return - The result of the update. 
    remote isolated function patchReceiptSettings(string bookId, ReceiptSettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/receipt`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get a book's payroll settings.
    #
    # + bookId - The book's id. 
    # + return - The payroll settings for the specified book. 
    remote isolated function getPayrollSettings(string bookId) returns PayrollSettings|error {
        string resourcePath = string `/${bookId}/settings/payroll`;
        PayrollSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's payroll settings.
    #
    # + bookId - The book's id. 
    # + payload - The book's payroll settings being altered. 
    # + return - The result of the update. 
    remote isolated function patchPayrollSettings(string bookId, PayrollSettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/payroll`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Updates selected fields of a legal contact's phone number in a book's payroll settings.
    #
    # + bookId - The book's id. 
    # + 'type - The type of phone number. This can either be `phone` or the phone number type id. 
    # + payload - The phone number being altered. 
    # + return - The result of the update. 
    remote isolated function patchPayrollSettingsContactPhoneNumber(string bookId, string 'type, BookPhoneNumberPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/payroll/legalContact/phoneNumbers/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Updates selected fields of a legal contact's electronic address in a book's payroll settings.
    #
    # + bookId - The book's id. 
    # + 'type - The type of electronic address. This can either be `email` or the email type id. 
    # + payload - The electronic address being altered. 
    # + return - The result of the update. 
    remote isolated function patchPayrollSettingsElectronicAddress(string bookId, string 'type, BookElectronicAddressPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/payroll/legalContact/electronicAddresses/${'type}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get a book's time entry settings.
    #
    # + bookId - The book's id. 
    # + return - The time entry settings for the specified book. 
    remote isolated function getTimeEntrySettings(string bookId) returns TimeEntrySettings|error {
        string resourcePath = string `/${bookId}/settings/timeEntries`;
        TimeEntrySettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates selected fields of a book's time entry settings.
    #
    # + bookId - The book's id. 
    # + payload - The book's time entry settings being altered. 
    # + return - The result of the update. 
    remote isolated function patchTimeEntrySettings(string bookId, TimeEntrySettingsPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/settings/timeEntries`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of templates for the specified book. 
    remote isolated function getTemplates(string bookId, int page = 1, int perPage = 0) returns TemplateTypeRef|error {
        string resourcePath = string `/${bookId}/templates`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TemplateTypeRef response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a template's logo for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getTemplateLogo(string bookId, string templateId) returns FileContentResult|error {
        string resourcePath = string `/${bookId}/templates/${templateId}/logo`;
        FileContentResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of invoice templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of invoices templates for the specified book. 
    remote isolated function getInvoiceTemplates(string bookId, int page = 1, int perPage = 0) returns InvoiceTemplates|error {
        string resourcePath = string `/${bookId}/templates/invoices`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InvoiceTemplates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets an invoice template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getInvoiceTemplate(string bookId, string templateId) returns InvoiceTemplate|error {
        string resourcePath = string `/${bookId}/templates/invoices/${templateId}`;
        InvoiceTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of estimate templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of estimates templates for the specified book. 
    remote isolated function getEstimateTemplates(string bookId, int page = 1, int perPage = 0) returns EstimateTemplates|error {
        string resourcePath = string `/${bookId}/templates/estimates`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EstimateTemplates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets an estimate template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getEstimateTemplate(string bookId, string templateId) returns EstimateTemplate|error {
        string resourcePath = string `/${bookId}/templates/estimates/${templateId}`;
        EstimateTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of customer adjustment note templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of customer adjustment notes templates for the specified book. 
    remote isolated function getCustomerAdjustmentNotesTemplates(string bookId, int page = 1, int perPage = 0) returns Templates|error {
        string resourcePath = string `/${bookId}/templates/customerAdjustmentNotes`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Templates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a customer adjustment note template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getCustomerAdjustmentNotesTemplate(string bookId, string templateId) returns Template|error {
        string resourcePath = string `/${bookId}/templates/customerAdjustmentNotes/${templateId}`;
        Template response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of bill templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of bills templates for the specified book. 
    remote isolated function getBillTemplates(string bookId, int page = 1, int perPage = 0) returns Templates|error {
        string resourcePath = string `/${bookId}/templates/bills`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Templates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a bill template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getBillTemplate(string bookId, string templateId) returns Template|error {
        string resourcePath = string `/${bookId}/templates/bills/${templateId}`;
        Template response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of supplier adjustment note templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of supplier adjustment notes templates for the specified book. 
    remote isolated function getSupplierAdjustmentNotesTemplates(string bookId, int page = 1, int perPage = 0) returns Templates|error {
        string resourcePath = string `/${bookId}/templates/supplierAdjustmentNotes`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Templates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a supplier adjustment note template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getSupplierAdjustmentNotesTemplate(string bookId, string templateId) returns Template|error {
        string resourcePath = string `/${bookId}/templates/supplierAdjustmentNotes/${templateId}`;
        Template response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of expense claim templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of expense claims templates for the specified book. 
    remote isolated function getExpenseclaimsTemplates(string bookId, int page = 1, int perPage = 0) returns Templates|error {
        string resourcePath = string `/${bookId}/templates/expenseclaims`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Templates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets an expense claim template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getExpenseclaimssTemplate(string bookId, string templateId) returns Template|error {
        string resourcePath = string `/${bookId}/templates/expenseclaims/${templateId}`;
        Template response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of customer statement templates for the specified book.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of super funds per page. 
    # + return - A list of customer statements templates for the specified book. 
    remote isolated function getCustomerStatementsTemplates(string bookId, int page = 1, int perPage = 0) returns CustomerStatementsTemplates|error {
        string resourcePath = string `/${bookId}/templates/customerStatements`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomerStatementsTemplates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a customer statement template for the specified book.
    #
    # + bookId - The book's id. 
    # + templateId - The template's id. 
    # + return - The template. 
    remote isolated function getCustomerStatementsTemplate(string bookId, string templateId) returns CustomerStatementsTemplate|error {
        string resourcePath = string `/${bookId}/templates/customerStatements/${templateId}`;
        CustomerStatementsTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a paged list of tax groups for the specified book.
    #
    # + bookId - The book's id. 
    # + effectiveDate - The effective date for the tax rates. 
    # + page - The page to retrieve. 
    # + perPage - The number of groups per page. 
    # + return - A paged list of tax groups for the specified book. 
    remote isolated function getTaxGroups(string bookId, string effectiveDate, int page = 1, int perPage = 0) returns TaxGroups|error {
        string resourcePath = string `/${bookId}/taxgroups/${effectiveDate}`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaxGroups response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a tax group with tax rates as at the supplied effective date.
    #
    # + bookId - The book's id. 
    # + taxGroupId - The tax group's id. 
    # + effectiveDate - The effective date for the tax rates. 
    # + return - The requested tax group. 
    remote isolated function getTaxGroup(string bookId, string taxGroupId, string effectiveDate) returns TaxGroups|error {
        string resourcePath = string `/${bookId}/taxgroups/${taxGroupId}/${effectiveDate}`;
        TaxGroups response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets tax rates as at the supplied effective date.
    #
    # + bookId - The book's id. 
    # + effectiveDate - The effective date for the tax rates. 
    # + page - The page to retrieve. 
    # + perPage - The number of rates per page. 
    # + return - A paged list of tax rates for the specified book. 
    remote isolated function getTaxRates(string bookId, string effectiveDate, int page = 1, int perPage = 0) returns TaxRates|error {
        string resourcePath = string `/${bookId}/taxrates/${effectiveDate}`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaxRates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a tax rate as at the supplied effective date.
    #
    # + bookId - The book's id. 
    # + taxRateId - The tax rate's id. 
    # + effectiveDate - The effective date for the tax rate. 
    # + return - The requested tax rate. 
    remote isolated function getTaxRate(string bookId, string taxRateId, string effectiveDate) returns TaxRate|error {
        string resourcePath = string `/${bookId}/taxrates/${taxRateId}/${effectiveDate}`;
        TaxRate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of items.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of items per page. 
    # + return - A paged list of items for the specified book. 
    remote isolated function getItems(string bookId, int page = 1, int perPage = 0) returns Items|error {
        string resourcePath = string `/${bookId}/items`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Items response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new item.
    #
    # + bookId - The book's id. 
    # + payload - The item to create. 
    # + return - The id of the item that has been created. 
    remote isolated function createItem(string bookId, ItemInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an item.
    #
    # + bookId - The book's id. 
    # + itemId - The item's id. 
    # + return - The requested item. 
    remote isolated function getItem(string bookId, string itemId) returns Item|error {
        string resourcePath = string `/${bookId}/items/${itemId}`;
        Item response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing item.
    #
    # + bookId - The book's id. 
    # + itemId - The item's id. 
    # + payload - Details of the updated item. 
    # + return - The result of the update. 
    remote isolated function updateItem(string bookId, string itemId, ItemInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/items/${itemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing item.
    #
    # + bookId - The book's id. 
    # + itemId - The item's id. 
    # + return - The result of the deletion. 
    remote isolated function deleteItem(string bookId, string itemId) returns http:Response|error {
        string resourcePath = string `/${bookId}/items/${itemId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates selected fields of an existing item.
    #
    # + bookId - The book's id. 
    # + itemId - The item's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchItem(string bookId, string itemId, ItemPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/items/${itemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of time entries.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of time entries per page. 
    # + return - A paged list of time entries for the specified book. 
    remote isolated function getTimeEntries(string bookId, int page = 1, int perPage = 0) returns TimeEntries|error {
        string resourcePath = string `/${bookId}/timeEntries`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TimeEntries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a time entry.
    #
    # + bookId - The book's id. 
    # + timeEntryId - The time entry's id. 
    # + return - The requested time entry. 
    remote isolated function getTimeEntry(string bookId, string timeEntryId) returns TimeEntry|error {
        string resourcePath = string `/${bookId}/timeEntries/${timeEntryId}`;
        TimeEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing time entry.
    #
    # + bookId - The book's id. 
    # + timeEntryId - The time entry's id. 
    # + payload - Details of the updated time entry. 
    # + return - The result of the update. 
    remote isolated function updateTimeEntry(string bookId, string timeEntryId, TimeEntryInput payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/timeEntries/${timeEntryId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing time entry.
    #
    # + bookId - The book's id. 
    # + timeEntryId - The time entry's id. 
    # + return - The result of the delete. 
    remote isolated function deleteTimeEntry(string bookId, string timeEntryId) returns http:Response|error {
        string resourcePath = string `/${bookId}/timeEntries/${timeEntryId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Creates a new time entry.
    #
    # + bookId - The book's id. 
    # + payload - Details of the new time entry. 
    # + return - The id of the time entry that has been created. 
    remote isolated function createTimeEntry(string bookId, TimeEntryInput payload) returns IdResponse|error {
        string resourcePath = string `/${bookId}/timeentries`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates selected fields of a time entry.
    #
    # + bookId - The book's id. 
    # + timeEntryId - The time entry's id. 
    # + payload - Details to update. 
    # + return - The result of the update. 
    remote isolated function patchTimeEntry(string bookId, string timeEntryId, TimeEntryPatch payload) returns http:Response|error {
        string resourcePath = string `/${bookId}/timeentries/${timeEntryId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets a list of users.
    #
    # + bookId - The book's id. 
    # + page - The page to retrieve. 
    # + perPage - The number of users per page. 
    # + return - A paged list of users for the specified book. 
    remote isolated function getUsers(string bookId, int page = 1, int perPage = 0) returns Users|error {
        string resourcePath = string `/${bookId}/users`;
        map<anydata> queryParam = {"page": page, "perPage": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Users response = check self.clientEp->get(resourcePath);
        return response;
    }
}
