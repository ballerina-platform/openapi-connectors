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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API key `Authorization`
    string authorization;
|};

# Provides Auth configurations needed when communicating with a remote HTTP endpoint.
public type AuthConfig record {|
    # Auth Configuration
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig|ApiKeysConfig auth;
|};

# This is a generated connector for [Square Connect API 2.0](https://squareup.com/us/en) OpenAPI Specification.
@display {label: "SquareUp", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Please create a Squareup account and obtain tokens.
    #
    # + authConfig - Configurations used for Authentication 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(AuthConfig authConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.squareup.com") returns error? {
        if authConfig.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>authConfig.auth).cloneReadOnly();
        } else {
            clientConfig.auth = <http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig>authConfig.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create Mobile Authorization Code
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createMobileAuthorizationCode(CreateMobileAuthorizationCodeRequest payload) returns CreateMobileAuthorizationCodeResponse|error {
        string resourcePath = string `/mobile/authorization-code`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateMobileAuthorizationCodeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RenewToken
    #
    # + clientId - Your application ID, available from the [developer dashboard](https://developer.squareup.com/apps). 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function renewToken(string clientId, RenewTokenRequest payload) returns RenewTokenResponse|error {
        string resourcePath = string `/oauth2/clients/${clientId}/access-token/renew`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RenewTokenResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # RevokeToken
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function revokeToken(RevokeTokenRequest payload) returns RevokeTokenResponse|error {
        string resourcePath = string `/oauth2/revoke`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RevokeTokenResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # ObtainToken
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function obtainToken(ObtainTokenRequest payload) returns ObtainTokenResponse|error {
        string resourcePath = string `/oauth2/token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ObtainTokenResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListEmployees
    #
    # + 'order - The order in which employees are listed in the response, based on their created_at field.      Default value: ASC 
    # + beginUpdatedAt - If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format 
    # + endUpdatedAt - If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format. 
    # + beginCreatedAt - If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format. 
    # + endCreatedAt - If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format. 
    # + status - If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE). 
    # + externalId - If provided, the endpoint returns only employee entities with the specified external_id. 
    # + 'limit - The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. 
    # + batchToken - A pagination cursor to retrieve the next set of results for your original query to the endpoint. 
    # + return - Success 
    remote isolated function listEmployees(string? 'order = (), string? beginUpdatedAt = (), string? endUpdatedAt = (), string? beginCreatedAt = (), string? endCreatedAt = (), string? status = (), string? externalId = (), int? 'limit = (), string? batchToken = ()) returns V1Employee[]|error {
        string resourcePath = string `/v1/me/employees`;
        map<anydata> queryParam = {"order": 'order, "begin_updated_at": beginUpdatedAt, "end_updated_at": endUpdatedAt, "begin_created_at": beginCreatedAt, "end_created_at": endCreatedAt, "status": status, "external_id": externalId, "limit": 'limit, "batch_token": batchToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        V1Employee[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateEmployee
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createEmployee(V1Employee payload) returns V1Employee|error {
        string resourcePath = string `/v1/me/employees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        V1Employee response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveEmployee
    #
    # + employeeId - The employee's ID. 
    # + return - Success 
    remote isolated function retrieveEmployee(string employeeId) returns V1Employee|error {
        string resourcePath = string `/v1/me/employees/${employeeId}`;
        V1Employee response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateEmployee
    #
    # + employeeId - The ID of the role to modify. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateEmployee(string employeeId, V1Employee payload) returns V1Employee|error {
        string resourcePath = string `/v1/me/employees/${employeeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        V1Employee response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # ListEmployeeRoles
    #
    # + 'order - The order in which employees are listed in the response, based on their created_at field.Default value: ASC 
    # + 'limit - The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. 
    # + batchToken - A pagination cursor to retrieve the next set of results for your original query to the endpoint. 
    # + return - Success 
    remote isolated function listEmployeeRoles(string? 'order = (), int? 'limit = (), string? batchToken = ()) returns V1EmployeeRole[]|error {
        string resourcePath = string `/v1/me/roles`;
        map<anydata> queryParam = {"order": 'order, "limit": 'limit, "batch_token": batchToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        V1EmployeeRole[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateEmployeeRole
    #
    # + payload - An EmployeeRole object with a name and permissions, and an optional owner flag. 
    # + return - Success 
    remote isolated function createEmployeeRole(V1EmployeeRole payload) returns V1EmployeeRole|error {
        string resourcePath = string `/v1/me/roles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        V1EmployeeRole response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveEmployeeRole
    #
    # + roleId - The role's ID. 
    # + return - Success 
    remote isolated function retrieveEmployeeRole(string roleId) returns V1EmployeeRole|error {
        string resourcePath = string `/v1/me/roles/${roleId}`;
        V1EmployeeRole response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateEmployeeRole
    #
    # + roleId - The ID of the role to modify. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateEmployeeRole(string roleId, V1EmployeeRole payload) returns V1EmployeeRole|error {
        string resourcePath = string `/v1/me/roles/${roleId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        V1EmployeeRole response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # ListOrders
    #
    # + locationId - The ID of the location to list online store orders for. 
    # + 'order - The order in which payments are listed in the response. 
    # + 'limit - The maximum number of payments to return in a single response. This value cannot exceed 200. 
    # + batchToken - A pagination cursor to retrieve the next set of results for your original query to the endpoint. 
    # + return - Success 
    remote isolated function listOrders(string locationId, string? 'order = (), int? 'limit = (), string? batchToken = ()) returns V1Order[]|error {
        string resourcePath = string `/v1/${locationId}/orders`;
        map<anydata> queryParam = {"order": 'order, "limit": 'limit, "batch_token": batchToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        V1Order[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveOrder
    #
    # + locationId - The ID of the order's associated location. 
    # + orderId - The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint 
    # + return - Success 
    remote isolated function retrieveOrder(string locationId, string orderId) returns V1Order|error {
        string resourcePath = string `/v1/${locationId}/orders/${orderId}`;
        V1Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateOrder
    #
    # + locationId - The ID of the order's associated location. 
    # + orderId - The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateOrder(string locationId, string orderId, V1UpdateOrderRequest payload) returns V1Order|error {
        string resourcePath = string `/v1/${locationId}/orders/${orderId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        V1Order response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # ListPayments
    #
    # + locationId - The ID of the location to list payments for. If you specify me, this endpoint returns payments aggregated from all of the business's locations. 
    # + 'order - The order in which payments are listed in the response. 
    # + beginTime - The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. 
    # + endTime - The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. 
    # + 'limit - The maximum number of payments to return in a single response. This value cannot exceed 200. 
    # + batchToken - A pagination cursor to retrieve the next set of results for your original query to the endpoint. 
    # + includePartial - Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed. 
    # + return - Success 
    remote isolated function listPayments(string locationId, string? 'order = (), string? beginTime = (), string? endTime = (), int? 'limit = (), string? batchToken = (), boolean? includePartial = ()) returns V1Payment[]|error {
        string resourcePath = string `/v1/${locationId}/payments`;
        map<anydata> queryParam = {"order": 'order, "begin_time": beginTime, "end_time": endTime, "limit": 'limit, "batch_token": batchToken, "include_partial": includePartial};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        V1Payment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrievePayment
    #
    # + locationId - The ID of the payment's associated location. 
    # + paymentId - The Square-issued payment ID. payment_id comes from Payment objects returned by the List Payments endpoint, Settlement objects returned by the List Settlements endpoint, or Refund objects returned by the List Refunds endpoint. 
    # + return - Success 
    remote isolated function retrievePayment(string locationId, string paymentId) returns V1Payment|error {
        string resourcePath = string `/v1/${locationId}/payments/${paymentId}`;
        V1Payment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListRefunds
    #
    # + locationId - The ID of the location to list refunds for. 
    # + 'order - The order in which payments are listed in the response. 
    # + beginTime - The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. 
    # + endTime - The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. 
    # + 'limit - The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods. 
    # + batchToken - A pagination cursor to retrieve the next set of results for your original query to the endpoint. 
    # + return - Success 
    remote isolated function listRefunds(string locationId, string? 'order = (), string? beginTime = (), string? endTime = (), int? 'limit = (), string? batchToken = ()) returns V1Refund[]|error {
        string resourcePath = string `/v1/${locationId}/refunds`;
        map<anydata> queryParam = {"order": 'order, "begin_time": beginTime, "end_time": endTime, "limit": 'limit, "batch_token": batchToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        V1Refund[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateRefund
    #
    # + locationId - The ID of the original payment's associated location. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createRefund(string locationId, V1CreateRefundRequest payload) returns V1Refund|error {
        string resourcePath = string `/v1/${locationId}/refunds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        V1Refund response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListSettlements
    #
    # + locationId - The ID of the location to list settlements for. If you specify me, this endpoint returns settlements aggregated from all of the business's locations. 
    # + 'order - The order in which settlements are listed in the response. 
    # + beginTime - The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. 
    # + endTime - The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. 
    # + 'limit - The maximum number of settlements to return in a single response. This value cannot exceed 200. 
    # + status - Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED). 
    # + batchToken - A pagination cursor to retrieve the next set of results for your original query to the endpoint. 
    # + return - Success 
    remote isolated function listSettlements(string locationId, string? 'order = (), string? beginTime = (), string? endTime = (), int? 'limit = (), string? status = (), string? batchToken = ()) returns V1Settlement[]|error {
        string resourcePath = string `/v1/${locationId}/settlements`;
        map<anydata> queryParam = {"order": 'order, "begin_time": beginTime, "end_time": endTime, "limit": 'limit, "status": status, "batch_token": batchToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        V1Settlement[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveSettlement
    #
    # + locationId - The ID of the settlements's associated location. 
    # + settlementId - The settlement's Square-issued ID. You obtain this value from Settlement objects returned by the List Settlements endpoint. 
    # + return - Success 
    remote isolated function retrieveSettlement(string locationId, string settlementId) returns V1Settlement|error {
        string resourcePath = string `/v1/${locationId}/settlements/${settlementId}`;
        V1Settlement response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RegisterDomain
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function registerDomain(RegisterDomainRequest payload) returns RegisterDomainResponse|error {
        string resourcePath = string `/v2/apple-pay/domains`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RegisterDomainResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListBankAccounts
    #
    # + cursor - The pagination cursor returned by a previous call to this endpoint. Use it in the next `ListBankAccounts` request to retrieve the next set  of results. See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information. 
    # + 'limit - Upper limit on the number of bank accounts to return in the response.  Currently, 1000 is the largest supported limit. You can specify a limit  of up to 1000 bank accounts. This is also the default limit. 
    # + locationId - Location ID. You can specify this optional filter  to retrieve only the linked bank accounts belonging to a specific location. 
    # + return - Success 
    remote isolated function listBankAccounts(string? cursor = (), int? 'limit = (), string? locationId = ()) returns ListBankAccountsResponse|error {
        string resourcePath = string `/v2/bank-accounts`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit, "location_id": locationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBankAccountsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # GetBankAccountByV1Id
    #
    # + v1BankAccountId - Connect V1 ID of the desired `BankAccount`. For more information, see  [Retrieve a bank account by using an ID issued by V1 Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api). 
    # + return - Success 
    remote isolated function getBankAccountByV1Id(string v1BankAccountId) returns GetBankAccountByV1IdResponse|error {
        string resourcePath = string `/v2/bank-accounts/by-v1-id/${v1BankAccountId}`;
        GetBankAccountByV1IdResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # GetBankAccount
    #
    # + bankAccountId - Square-issued ID of the desired `BankAccount`. 
    # + return - Success 
    remote isolated function getBankAccount(string bankAccountId) returns GetBankAccountResponse|error {
        string resourcePath = string `/v2/bank-accounts/${bankAccountId}`;
        GetBankAccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateBooking
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createBooking(CreateBookingRequest payload) returns CreateBookingResponse|error {
        string resourcePath = string `/v2/bookings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateBookingResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchAvailability
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchAvailability(SearchAvailabilityRequest payload) returns SearchAvailabilityResponse|error {
        string resourcePath = string `/v2/bookings/availability/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchAvailabilityResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveBusinessBookingProfile
    #
    # + return - Success 
    remote isolated function retrieveBusinessBookingProfile() returns RetrieveBusinessBookingProfileResponse|error {
        string resourcePath = string `/v2/bookings/business-booking-profile`;
        RetrieveBusinessBookingProfileResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListTeamMemberBookingProfiles
    #
    # + bookableOnly - Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`). 
    # + 'limit - The maximum number of results to return. 
    # + cursor - The cursor for paginating through the results. 
    # + locationId - Indicates whether to include only team members enabled at the given location in the returned result. 
    # + return - Success 
    remote isolated function listTeamMemberBookingProfiles(boolean? bookableOnly = (), int? 'limit = (), string? cursor = (), string? locationId = ()) returns ListTeamMemberBookingProfilesResponse|error {
        string resourcePath = string `/v2/bookings/team-member-booking-profiles`;
        map<anydata> queryParam = {"bookable_only": bookableOnly, "limit": 'limit, "cursor": cursor, "location_id": locationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListTeamMemberBookingProfilesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveTeamMemberBookingProfile
    #
    # + teamMemberId - The ID of the team member to retrieve. 
    # + return - Success 
    remote isolated function retrieveTeamMemberBookingProfile(string teamMemberId) returns RetrieveTeamMemberBookingProfileResponse|error {
        string resourcePath = string `/v2/bookings/team-member-booking-profiles/${teamMemberId}`;
        RetrieveTeamMemberBookingProfileResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveBooking
    #
    # + bookingId - The ID of the [Booking](https://developer.squareup.com/reference/square_2021-08-18/objects/Booking) object representing the to-be-retrieved booking. 
    # + return - Success 
    remote isolated function retrieveBooking(string bookingId) returns RetrieveBookingResponse|error {
        string resourcePath = string `/v2/bookings/${bookingId}`;
        RetrieveBookingResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateBooking
    #
    # + bookingId - The ID of the [Booking](https://developer.squareup.com/reference/square_2021-08-18/objects/Booking) object representing the to-be-updated booking. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateBooking(string bookingId, UpdateBookingRequest payload) returns UpdateBookingResponse|error {
        string resourcePath = string `/v2/bookings/${bookingId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateBookingResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # CancelBooking
    #
    # + bookingId - The ID of the [Booking](https://developer.squareup.com/reference/square_2021-08-18/objects/Booking) object representing the to-be-cancelled booking. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function cancelBooking(string bookingId, CancelBookingRequest payload) returns CancelBookingResponse|error {
        string resourcePath = string `/v2/bookings/${bookingId}/cancel`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CancelBookingResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListCards
    #
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information. 
    # + customerId - Limit results to cards associated with the customer supplied. By default, all cards owned by the merchant are returned. 
    # + includeDisabled - Includes disabled cards. By default, all enabled cards owned by the merchant are returned. 
    # + referenceId - Limit results to cards associated with the reference_id supplied. 
    # + sortOrder - Sorts the returned list by when the card was created with the specified order. This field defaults to ASC. 
    # + return - Success 
    remote isolated function listCards(string? cursor = (), string? customerId = (), boolean? includeDisabled = (), string? referenceId = (), string? sortOrder = ()) returns ListCardsResponse|error {
        string resourcePath = string `/v2/cards`;
        map<anydata> queryParam = {"cursor": cursor, "customer_id": customerId, "include_disabled": includeDisabled, "reference_id": referenceId, "sort_order": sortOrder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCardsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateCard
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createCard(CreateCardRequest payload) returns CreateCardResponse|error {
        string resourcePath = string `/v2/cards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveCard
    #
    # + cardId - Unique ID for the desired Card. 
    # + return - Success 
    remote isolated function retrieveCard(string cardId) returns RetrieveCardResponse|error {
        string resourcePath = string `/v2/cards/${cardId}`;
        RetrieveCardResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DisableCard
    #
    # + cardId - Unique ID for the desired Card. 
    # + return - Success 
    remote isolated function disableCard(string cardId) returns DisableCardResponse|error {
        string resourcePath = string `/v2/cards/${cardId}/disable`;
        http:Request request = new;
        //TODO: Update the request as needed;
        DisableCardResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # ListCashDrawerShifts
    #
    # + locationId - The ID of the location to query for a list of cash drawer shifts. 
    # + sortOrder - The order in which cash drawer shifts are listed in the response, based on their opened_at field. Default value: ASC 
    # + beginTime - The inclusive start time of the query on opened_at, in ISO 8601 format. 
    # + endTime - The exclusive end date of the query on opened_at, in ISO 8601 format. 
    # + 'limit - Number of cash drawer shift events in a page of results (200 by default, 1000 max). 
    # + cursor - Opaque cursor for fetching the next page of results. 
    # + return - Success 
    remote isolated function listCashDrawerShifts(string locationId, string? sortOrder = (), string? beginTime = (), string? endTime = (), int? 'limit = (), string? cursor = ()) returns ListCashDrawerShiftsResponse|error {
        string resourcePath = string `/v2/cash-drawers/shifts`;
        map<anydata> queryParam = {"location_id": locationId, "sort_order": sortOrder, "begin_time": beginTime, "end_time": endTime, "limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCashDrawerShiftsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveCashDrawerShift
    #
    # + locationId - The ID of the location to retrieve cash drawer shifts from. 
    # + shiftId - The shift ID. 
    # + return - Success 
    remote isolated function retrieveCashDrawerShift(string locationId, string shiftId) returns RetrieveCashDrawerShiftResponse|error {
        string resourcePath = string `/v2/cash-drawers/shifts/${shiftId}`;
        map<anydata> queryParam = {"location_id": locationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrieveCashDrawerShiftResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListCashDrawerShiftEvents
    #
    # + locationId - The ID of the location to list cash drawer shifts for. 
    # + shiftId - The shift ID. 
    # + 'limit - Number of resources to be returned in a page of results (200 by default, 1000 max). 
    # + cursor - Opaque cursor for fetching the next page of results. 
    # + return - Success 
    remote isolated function listCashDrawerShiftEvents(string locationId, string shiftId, int? 'limit = (), string? cursor = ()) returns ListCashDrawerShiftEventsResponse|error {
        string resourcePath = string `/v2/cash-drawers/shifts/${shiftId}/events`;
        map<anydata> queryParam = {"location_id": locationId, "limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCashDrawerShiftEventsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # BatchDeleteCatalogObjects
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchDeleteCatalogObjects(BatchDeleteCatalogObjectsRequest payload) returns BatchDeleteCatalogObjectsResponse|error {
        string resourcePath = string `/v2/catalog/batch-delete`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchDeleteCatalogObjectsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BatchRetrieveCatalogObjects
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchRetrieveCatalogObjects(BatchRetrieveCatalogObjectsRequest payload) returns BatchRetrieveCatalogObjectsResponse|error {
        string resourcePath = string `/v2/catalog/batch-retrieve`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchRetrieveCatalogObjectsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BatchUpsertCatalogObjects
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchUpsertCatalogObjects(BatchUpsertCatalogObjectsRequest payload) returns BatchUpsertCatalogObjectsResponse|error {
        string resourcePath = string `/v2/catalog/batch-upsert`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchUpsertCatalogObjectsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # CatalogInfo
    #
    # + return - Success 
    remote isolated function catalogInfo() returns CatalogInfoResponse|error {
        string resourcePath = string `/v2/catalog/info`;
        CatalogInfoResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListCatalog
    #
    # + cursor - The pagination cursor returned in the previous response. Leave unset for an initial request. The page size is currently set to be 100. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information. 
    # + types - An optional case-insensitive, comma-separated list of object types to retrieve. The valid values are defined in the [CatalogObjectType](https://developer.squareup.com/reference/square_2021-08-18/enums/CatalogObjectType) enum, including `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`, `MODIFIER_LIST`, or `IMAGE`. If this is unspecified, the operation returns objects of all the types at the version of the Square API used to make the request. 
    # + catalogVersion - The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s' `version` attribute. 
    # + return - Success 
    remote isolated function listCatalog(string? cursor = (), string? types = (), int? catalogVersion = ()) returns ListCatalogResponse|error {
        string resourcePath = string `/v2/catalog/list`;
        map<anydata> queryParam = {"cursor": cursor, "types": types, "catalog_version": catalogVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCatalogResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpsertCatalogObject
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function upsertCatalogObject(UpsertCatalogObjectRequest payload) returns UpsertCatalogObjectResponse|error {
        string resourcePath = string `/v2/catalog/object`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpsertCatalogObjectResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveCatalogObject
    #
    # + objectId - The object ID of any type of catalog objects to be retrieved. 
    # + includeRelatedObjects - If `true`, the response will include additional objects that are related to the requested object, as follows: If the `object` field of the response contains a `CatalogItem`, its associated `CatalogCategory`, `CatalogTax`, `CatalogImage` and `CatalogModifierList` objects will be returned in the `related_objects` field of the response. If the `object` field of the response contains a `CatalogItemVariation`, its parent `CatalogItem` will be returned in the `related_objects` field of the response. Default value: `false` 
    # + catalogVersion - Requests objects as of a specific version of the catalog. This allows you to retrieve historical versions of objects. The value to retrieve a specific version of an object can be found in the version field of [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s. 
    # + return - Success 
    remote isolated function retrieveCatalogObject(string objectId, boolean? includeRelatedObjects = (), int? catalogVersion = ()) returns RetrieveCatalogObjectResponse|error {
        string resourcePath = string `/v2/catalog/object/${objectId}`;
        map<anydata> queryParam = {"include_related_objects": includeRelatedObjects, "catalog_version": catalogVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrieveCatalogObjectResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DeleteCatalogObject
    #
    # + objectId - The ID of the catalog object to be deleted. When an object is deleted, other objects in the graph that depend on that object will be deleted as well (for example, deleting a catalog item will delete its catalog item variations). 
    # + return - Success 
    remote isolated function deleteCatalogObject(string objectId) returns DeleteCatalogObjectResponse|error {
        string resourcePath = string `/v2/catalog/object/${objectId}`;
        DeleteCatalogObjectResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # SearchCatalogObjects
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchCatalogObjects(SearchCatalogObjectsRequest payload) returns SearchCatalogObjectsResponse|error {
        string resourcePath = string `/v2/catalog/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchCatalogObjectsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchCatalogItems
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchCatalogItems(SearchCatalogItemsRequest payload) returns SearchCatalogItemsResponse|error {
        string resourcePath = string `/v2/catalog/search-catalog-items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchCatalogItemsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # UpdateItemModifierLists
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateItemModifierLists(UpdateItemModifierListsRequest payload) returns UpdateItemModifierListsResponse|error {
        string resourcePath = string `/v2/catalog/update-item-modifier-lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateItemModifierListsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # UpdateItemTaxes
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateItemTaxes(UpdateItemTaxesRequest payload) returns UpdateItemTaxesResponse|error {
        string resourcePath = string `/v2/catalog/update-item-taxes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateItemTaxesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListCustomers
    #
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for your original query. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + 'limit - The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.  The limit is ignored if it is less than 1 or greater than 100. The default value is 100. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + sortField - Indicates how customers should be sorted. The default value is `DEFAULT`. 
    # + sortOrder - Indicates whether customers should be sorted in ascending (`ASC`) or descending (`DESC`) order. The default value is `ASC`. 
    # + return - Success 
    remote isolated function listCustomers(string? cursor = (), int? 'limit = (), string? sortField = (), string? sortOrder = ()) returns ListCustomersResponse|error {
        string resourcePath = string `/v2/customers`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit, "sort_field": sortField, "sort_order": sortOrder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCustomersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateCustomer
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createCustomer(CreateCustomerRequest payload) returns CreateCustomerResponse|error {
        string resourcePath = string `/v2/customers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCustomerResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListCustomerGroups
    #
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for your original query. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + 'limit - The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.  The limit is ignored if it is less than 1 or greater than 50. The default value is 50. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + return - Success 
    remote isolated function listCustomerGroups(string? cursor = (), int? 'limit = ()) returns ListCustomerGroupsResponse|error {
        string resourcePath = string `/v2/customers/groups`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCustomerGroupsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateCustomerGroup
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createCustomerGroup(CreateCustomerGroupRequest payload) returns CreateCustomerGroupResponse|error {
        string resourcePath = string `/v2/customers/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCustomerGroupResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveCustomerGroup
    #
    # + groupId - The ID of the customer group to retrieve. 
    # + return - Success 
    remote isolated function retrieveCustomerGroup(string groupId) returns RetrieveCustomerGroupResponse|error {
        string resourcePath = string `/v2/customers/groups/${groupId}`;
        RetrieveCustomerGroupResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateCustomerGroup
    #
    # + groupId - The ID of the customer group to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateCustomerGroup(string groupId, UpdateCustomerGroupRequest payload) returns UpdateCustomerGroupResponse|error {
        string resourcePath = string `/v2/customers/groups/${groupId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateCustomerGroupResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # DeleteCustomerGroup
    #
    # + groupId - The ID of the customer group to delete. 
    # + return - Success 
    remote isolated function deleteCustomerGroup(string groupId) returns DeleteCustomerGroupResponse|error {
        string resourcePath = string `/v2/customers/groups/${groupId}`;
        DeleteCustomerGroupResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # SearchCustomers
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchCustomers(SearchCustomersRequest payload) returns SearchCustomersResponse|error {
        string resourcePath = string `/v2/customers/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchCustomersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListCustomerSegments
    #
    # + cursor - A pagination cursor returned by previous calls to `ListCustomerSegments`. This cursor is used to retrieve the next set of query results. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + 'limit - The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.  The limit is ignored if it is less than 1 or greater than 50. The default value is 50. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + return - Success 
    remote isolated function listCustomerSegments(string? cursor = (), int? 'limit = ()) returns ListCustomerSegmentsResponse|error {
        string resourcePath = string `/v2/customers/segments`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCustomerSegmentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveCustomerSegment
    #
    # + segmentId - The Square-issued ID of the customer segment. 
    # + return - Success 
    remote isolated function retrieveCustomerSegment(string segmentId) returns RetrieveCustomerSegmentResponse|error {
        string resourcePath = string `/v2/customers/segments/${segmentId}`;
        RetrieveCustomerSegmentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveCustomer
    #
    # + customerId - The ID of the customer to retrieve. 
    # + return - Success 
    remote isolated function retrieveCustomer(string customerId) returns RetrieveCustomerResponse|error {
        string resourcePath = string `/v2/customers/${customerId}`;
        RetrieveCustomerResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateCustomer
    #
    # + customerId - The ID of the customer to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateCustomer(string customerId, UpdateCustomerRequest payload) returns UpdateCustomerResponse|error {
        string resourcePath = string `/v2/customers/${customerId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateCustomerResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # DeleteCustomer
    #
    # + customerId - The ID of the customer to delete. 
    # + 'version - The current version of the customer profile. As a best practice, you should include this parameter to enable [optimistic concurrency](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency) control.  For more information, see [Delete a customer profile](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#delete-customer-profile). 
    # + return - Success 
    remote isolated function deleteCustomer(string customerId, int? 'version = ()) returns DeleteCustomerResponse|error {
        string resourcePath = string `/v2/customers/${customerId}`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeleteCustomerResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # CreateCustomerCard
    #
    # + customerId - The Square ID of the customer profile the card is linked to. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createCustomerCard(string customerId, CreateCustomerCardRequest payload) returns CreateCustomerCardResponse|error {
        string resourcePath = string `/v2/customers/${customerId}/cards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCustomerCardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # DeleteCustomerCard
    #
    # + customerId - The ID of the customer that the card on file belongs to. 
    # + cardId - The ID of the card on file to delete. 
    # + return - Success 
    remote isolated function deleteCustomerCard(string customerId, string cardId) returns DeleteCustomerCardResponse|error {
        string resourcePath = string `/v2/customers/${customerId}/cards/${cardId}`;
        DeleteCustomerCardResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # AddGroupToCustomer
    #
    # + customerId - The ID of the customer to add to a group. 
    # + groupId - The ID of the customer group to add the customer to. 
    # + return - Success 
    remote isolated function addGroupToCustomer(string customerId, string groupId) returns AddGroupToCustomerResponse|error {
        string resourcePath = string `/v2/customers/${customerId}/groups/${groupId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AddGroupToCustomerResponse response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # RemoveGroupFromCustomer
    #
    # + customerId - The ID of the customer to remove from the group. 
    # + groupId - The ID of the customer group to remove the customer from. 
    # + return - Success 
    remote isolated function removeGroupFromCustomer(string customerId, string groupId) returns RemoveGroupFromCustomerResponse|error {
        string resourcePath = string `/v2/customers/${customerId}/groups/${groupId}`;
        RemoveGroupFromCustomerResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # ListDeviceCodes
    #
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. 
    # + locationId - If specified, only returns DeviceCodes of the specified location. Returns DeviceCodes of all locations if empty. 
    # + productType - If specified, only returns DeviceCodes targeting the specified product type. Returns DeviceCodes of all product types if empty. 
    # + status - If specified, returns DeviceCodes with the specified statuses. Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty. 
    # + return - Success 
    remote isolated function listDeviceCodes(string? cursor = (), string? locationId = (), string? productType = (), string? status = ()) returns ListDeviceCodesResponse|error {
        string resourcePath = string `/v2/devices/codes`;
        map<anydata> queryParam = {"cursor": cursor, "location_id": locationId, "product_type": productType, "status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDeviceCodesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateDeviceCode
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createDeviceCode(CreateDeviceCodeRequest payload) returns CreateDeviceCodeResponse|error {
        string resourcePath = string `/v2/devices/codes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateDeviceCodeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetDeviceCode
    #
    # + id - The unique identifier for the device code. 
    # + return - Success 
    remote isolated function getDeviceCode(string id) returns GetDeviceCodeResponse|error {
        string resourcePath = string `/v2/devices/codes/${id}`;
        GetDeviceCodeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListDisputes
    #
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination). 
    # + states - The dispute states to filter the result. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`). 
    # + locationId - The ID of the location for which to return a list of disputes. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`) associated with all locations. 
    # + return - Success 
    remote isolated function listDisputes(string? cursor = (), string? states = (), string? locationId = ()) returns ListDisputesResponse|error {
        string resourcePath = string `/v2/disputes`;
        map<anydata> queryParam = {"cursor": cursor, "states": states, "location_id": locationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDisputesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveDispute
    #
    # + disputeId - The ID of the dispute you want more details about. 
    # + return - Success 
    remote isolated function retrieveDispute(string disputeId) returns RetrieveDisputeResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}`;
        RetrieveDisputeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # AcceptDispute
    #
    # + disputeId - The ID of the dispute you want to accept. 
    # + return - Success 
    remote isolated function acceptDispute(string disputeId) returns AcceptDisputeResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}/accept`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AcceptDisputeResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # ListDisputeEvidence
    #
    # + disputeId - The ID of the dispute. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination). 
    # + return - Success 
    remote isolated function listDisputeEvidence(string disputeId, string? cursor = ()) returns ListDisputeEvidenceResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}/evidence`;
        map<anydata> queryParam = {"cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDisputeEvidenceResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateDisputeEvidenceText
    #
    # + disputeId - The ID of the dispute you want to upload evidence for. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createDisputeEvidenceText(string disputeId, CreateDisputeEvidenceTextRequest payload) returns CreateDisputeEvidenceTextResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}/evidence-text`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateDisputeEvidenceTextResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveDisputeEvidence
    #
    # + disputeId - The ID of the dispute that you want to retrieve evidence from. 
    # + evidenceId - The ID of the evidence to retrieve. 
    # + return - Success 
    remote isolated function retrieveDisputeEvidence(string disputeId, string evidenceId) returns RetrieveDisputeEvidenceResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}/evidence/${evidenceId}`;
        RetrieveDisputeEvidenceResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DeleteDisputeEvidence
    #
    # + disputeId - The ID of the dispute you want to remove evidence from. 
    # + evidenceId - The ID of the evidence you want to remove. 
    # + return - Success 
    remote isolated function deleteDisputeEvidence(string disputeId, string evidenceId) returns DeleteDisputeEvidenceResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}/evidence/${evidenceId}`;
        DeleteDisputeEvidenceResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # SubmitEvidence
    #
    # + disputeId - The ID of the dispute that you want to submit evidence for. 
    # + return - Success 
    remote isolated function submitEvidence(string disputeId) returns SubmitEvidenceResponse|error {
        string resourcePath = string `/v2/disputes/${disputeId}/submit-evidence`;
        http:Request request = new;
        //TODO: Update the request as needed;
        SubmitEvidenceResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # ListEmployees
    #
    # + status - Specifies the EmployeeStatus to filter the employee by. 
    # + 'limit - The number of employees to be returned on each page. 
    # + cursor - The token required to retrieve the specified page of results. 
    # + return - Success 
    remote isolated function getEmployees(string? locationId = (), string? status = (), int? 'limit = (), string? cursor = ()) returns ListEmployeesResponse|error {
        string resourcePath = string `/v2/employees`;
        map<anydata> queryParam = {"location_id": locationId, "status": status, "limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListEmployeesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveEmployee
    #
    # + id - UUID for the employee that was requested. 
    # + return - Success 
    remote isolated function getEmployeesById(string id) returns RetrieveEmployeeResponse|error {
        string resourcePath = string `/v2/employees/${id}`;
        RetrieveEmployeeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListGiftCards
    #
    # + 'type - If a type is provided, gift cards of this type are returned  (see [GiftCardType](https://developer.squareup.com/reference/square_2021-08-18/enums/GiftCardType)). If no type is provided, it returns gift cards of all types. 
    # + state - If the state is provided, it returns the gift cards in the specified state  (see [GiftCardStatus](https://developer.squareup.com/reference/square_2021-08-18/enums/GiftCardStatus)). Otherwise, it returns the gift cards of all states. 
    # + 'limit - If a value is provided, it returns only that number of results per page. The maximum number of results allowed per page is 50. The default value is 30. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. If a cursor is not provided, it returns the first page of the results.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination). 
    # + customerId - If a value is provided, returns only the gift cards linked to the specified customer 
    # + return - Success 
    remote isolated function listGiftCards(string? 'type = (), string? state = (), int? 'limit = (), string? cursor = (), string? customerId = ()) returns ListGiftCardsResponse|error {
        string resourcePath = string `/v2/gift-cards`;
        map<anydata> queryParam = {"type": 'type, "state": state, "limit": 'limit, "cursor": cursor, "customer_id": customerId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListGiftCardsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateGiftCard
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createGiftCard(CreateGiftCardRequest payload) returns CreateGiftCardResponse|error {
        string resourcePath = string `/v2/gift-cards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateGiftCardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListGiftCardActivities
    #
    # + giftCardId - If you provide a gift card ID, the endpoint returns activities that belong  to the specified gift card. Otherwise, the endpoint returns all gift card activities for  the seller. 
    # + 'type - If you provide a type, the endpoint returns gift card activities of this type.  Otherwise, the endpoint returns all types of gift card activities. 
    # + locationId - If you provide a location ID, the endpoint returns gift card activities for that location.  Otherwise, the endpoint returns gift card activities for all locations. 
    # + beginTime - The timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one year. 
    # + endTime - The timestamp for the end of the reporting period, in RFC 3339 format. Inclusive. Default: The current time. 
    # + 'limit - If you provide a limit value, the endpoint returns the specified number  of results (or less) per page. A maximum value is 100. The default value is 50. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. If you do not provide the cursor, the call returns the first page of the results. 
    # + sortOrder - The order in which the endpoint returns the activities, based on `created_at`. - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default). 
    # + return - Success 
    remote isolated function listGiftCardActivities(string? giftCardId = (), string? 'type = (), string? locationId = (), string? beginTime = (), string? endTime = (), int? 'limit = (), string? cursor = (), string? sortOrder = ()) returns ListGiftCardActivitiesResponse|error {
        string resourcePath = string `/v2/gift-cards/activities`;
        map<anydata> queryParam = {"gift_card_id": giftCardId, "type": 'type, "location_id": locationId, "begin_time": beginTime, "end_time": endTime, "limit": 'limit, "cursor": cursor, "sort_order": sortOrder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListGiftCardActivitiesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateGiftCardActivity
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createGiftCardActivity(CreateGiftCardActivityRequest payload) returns CreateGiftCardActivityResponse|error {
        string resourcePath = string `/v2/gift-cards/activities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateGiftCardActivityResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveGiftCardFromGAN
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function retrieveGiftCardFromGAN(RetrieveGiftCardFromGANRequest payload) returns RetrieveGiftCardFromGANResponse|error {
        string resourcePath = string `/v2/gift-cards/from-gan`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RetrieveGiftCardFromGANResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveGiftCardFromNonce
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function retrieveGiftCardFromNonce(RetrieveGiftCardFromNonceRequest payload) returns RetrieveGiftCardFromNonceResponse|error {
        string resourcePath = string `/v2/gift-cards/from-nonce`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RetrieveGiftCardFromNonceResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # LinkCustomerToGiftCard
    #
    # + giftCardId - The ID of the gift card to link. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function linkCustomerToGiftCard(string giftCardId, LinkCustomerToGiftCardRequest payload) returns LinkCustomerToGiftCardResponse|error {
        string resourcePath = string `/v2/gift-cards/${giftCardId}/link-customer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinkCustomerToGiftCardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # UnlinkCustomerFromGiftCard
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function unlinkCustomerFromGiftCard(string giftCardId, UnlinkCustomerFromGiftCardRequest payload) returns UnlinkCustomerFromGiftCardResponse|error {
        string resourcePath = string `/v2/gift-cards/${giftCardId}/unlink-customer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UnlinkCustomerFromGiftCardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveGiftCard
    #
    # + id - The ID of the gift card to retrieve. 
    # + return - Success 
    remote isolated function retrieveGiftCard(string id) returns RetrieveGiftCardResponse|error {
        string resourcePath = string `/v2/gift-cards/${id}`;
        RetrieveGiftCardResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DeprecatedRetrieveInventoryAdjustment
    #
    # + adjustmentId - ID of the [InventoryAdjustment](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryAdjustment) to retrieve. 
    # + return - Success 
    remote isolated function deprecatedRetrieveInventoryAdjustment(string adjustmentId) returns RetrieveInventoryAdjustmentResponse|error {
        string resourcePath = string `/v2/inventory/adjustment/${adjustmentId}`;
        RetrieveInventoryAdjustmentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveInventoryAdjustment
    #
    # + adjustmentId - ID of the [InventoryAdjustment](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryAdjustment) to retrieve. 
    # + return - Success 
    remote isolated function retrieveInventoryAdjustment(string adjustmentId) returns RetrieveInventoryAdjustmentResponse|error {
        string resourcePath = string `/v2/inventory/adjustments/${adjustmentId}`;
        RetrieveInventoryAdjustmentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DeprecatedBatchChangeInventory
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function deprecatedBatchChangeInventory(BatchChangeInventoryRequest payload) returns BatchChangeInventoryResponse|error {
        string resourcePath = string `/v2/inventory/batch-change`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchChangeInventoryResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # DeprecatedBatchRetrieveInventoryChanges
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function deprecatedBatchRetrieveInventoryChanges(BatchRetrieveInventoryChangesRequest payload) returns BatchRetrieveInventoryChangesResponse|error {
        string resourcePath = string `/v2/inventory/batch-retrieve-changes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchRetrieveInventoryChangesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # DeprecatedBatchRetrieveInventoryCounts
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function deprecatedBatchRetrieveInventoryCounts(BatchRetrieveInventoryCountsRequest payload) returns BatchRetrieveInventoryCountsResponse|error {
        string resourcePath = string `/v2/inventory/batch-retrieve-counts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchRetrieveInventoryCountsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BatchChangeInventory
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchChangeInventory(BatchChangeInventoryRequest payload) returns BatchChangeInventoryResponse|error {
        string resourcePath = string `/v2/inventory/changes/batch-create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchChangeInventoryResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BatchRetrieveInventoryChanges
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchRetrieveInventoryChanges(BatchRetrieveInventoryChangesRequest payload) returns BatchRetrieveInventoryChangesResponse|error {
        string resourcePath = string `/v2/inventory/changes/batch-retrieve`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchRetrieveInventoryChangesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BatchRetrieveInventoryCounts
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchRetrieveInventoryCounts(BatchRetrieveInventoryCountsRequest payload) returns BatchRetrieveInventoryCountsResponse|error {
        string resourcePath = string `/v2/inventory/counts/batch-retrieve`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchRetrieveInventoryCountsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # DeprecatedRetrieveInventoryPhysicalCount
    #
    # + physicalCountId - ID of the [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryPhysicalCount) to retrieve. 
    # + return - Success 
    remote isolated function deprecatedRetrieveInventoryPhysicalCount(string physicalCountId) returns RetrieveInventoryPhysicalCountResponse|error {
        string resourcePath = string `/v2/inventory/physical-count/${physicalCountId}`;
        RetrieveInventoryPhysicalCountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveInventoryPhysicalCount
    #
    # + physicalCountId - ID of the [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryPhysicalCount) to retrieve. 
    # + return - Success 
    remote isolated function retrieveInventoryPhysicalCount(string physicalCountId) returns RetrieveInventoryPhysicalCountResponse|error {
        string resourcePath = string `/v2/inventory/physical-counts/${physicalCountId}`;
        RetrieveInventoryPhysicalCountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveInventoryTransfer
    #
    # + transferId - ID of the [InventoryTransfer](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryTransfer) to retrieve. 
    # + return - Success 
    remote isolated function retrieveInventoryTransfer(string transferId) returns RetrieveInventoryTransferResponse|error {
        string resourcePath = string `/v2/inventory/transfers/${transferId}`;
        RetrieveInventoryTransferResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveInventoryCount
    #
    # + catalogObjectId - ID of the [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) to retrieve. 
    # + locationIds - The [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) IDs to look up as a comma-separated list. An empty list queries all locations. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query. See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information. 
    # + return - Success 
    remote isolated function retrieveInventoryCount(string catalogObjectId, string? locationIds = (), string? cursor = ()) returns RetrieveInventoryCountResponse|error {
        string resourcePath = string `/v2/inventory/${catalogObjectId}`;
        map<anydata> queryParam = {"location_ids": locationIds, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrieveInventoryCountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveInventoryChanges
    #
    # + catalogObjectId - ID of the [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) to retrieve. 
    # + locationIds - The [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) IDs to look up as a comma-separated list. An empty list queries all locations. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query. See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information. 
    # + return - Success 
    remote isolated function retrieveInventoryChanges(string catalogObjectId, string? locationIds = (), string? cursor = ()) returns RetrieveInventoryChangesResponse|error {
        string resourcePath = string `/v2/inventory/${catalogObjectId}/changes`;
        map<anydata> queryParam = {"location_ids": locationIds, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrieveInventoryChangesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListInvoices
    #
    # + locationId - The ID of the location for which to list invoices. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + 'limit - The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server uses a default limit of 100 invoices. 
    # + return - Success 
    remote isolated function listInvoices(string locationId, string? cursor = (), int? 'limit = ()) returns ListInvoicesResponse|error {
        string resourcePath = string `/v2/invoices`;
        map<anydata> queryParam = {"location_id": locationId, "cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListInvoicesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateInvoice
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createInvoice(CreateInvoiceRequest payload) returns CreateInvoiceResponse|error {
        string resourcePath = string `/v2/invoices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateInvoiceResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchInvoices
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchInvoices(SearchInvoicesRequest payload) returns SearchInvoicesResponse|error {
        string resourcePath = string `/v2/invoices/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchInvoicesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetInvoice
    #
    # + invoiceId - The ID of the invoice to retrieve. 
    # + return - Success 
    remote isolated function getInvoice(string invoiceId) returns GetInvoiceResponse|error {
        string resourcePath = string `/v2/invoices/${invoiceId}`;
        GetInvoiceResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateInvoice
    #
    # + invoiceId - The ID of the invoice to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateInvoice(string invoiceId, UpdateInvoiceRequest payload) returns UpdateInvoiceResponse|error {
        string resourcePath = string `/v2/invoices/${invoiceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateInvoiceResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # DeleteInvoice
    #
    # + invoiceId - The ID of the invoice to delete. 
    # + 'version - The version of the [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) to delete. If you do not know the version, you can call [GetInvoice](https://developer.squareup.com/reference/square_2021-08-18/invoices-api/get-invoice) or  [ListInvoices](https://developer.squareup.com/reference/square_2021-08-18/invoices-api/list-invoices). 
    # + return - Success 
    remote isolated function deleteInvoice(string invoiceId, int? 'version = ()) returns DeleteInvoiceResponse|error {
        string resourcePath = string `/v2/invoices/${invoiceId}`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeleteInvoiceResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # CancelInvoice
    #
    # + invoiceId - The ID of the [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) to cancel. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function cancelInvoice(string invoiceId, CancelInvoiceRequest payload) returns CancelInvoiceResponse|error {
        string resourcePath = string `/v2/invoices/${invoiceId}/cancel`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CancelInvoiceResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # PublishInvoice
    #
    # + invoiceId - The ID of the invoice to publish. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function publishInvoice(string invoiceId, PublishInvoiceRequest payload) returns PublishInvoiceResponse|error {
        string resourcePath = string `/v2/invoices/${invoiceId}/publish`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublishInvoiceResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListBreakTypes
    #
    # + locationId - Filter the returned `BreakType` results to only those that are associated with the specified location. 
    # + 'limit - The maximum number of `BreakType` results to return per page. The number can range between 1 and 200. The default is 200. 
    # + cursor - A pointer to the next page of `BreakType` results to fetch. 
    # + return - Success 
    remote isolated function listBreakTypes(string? locationId = (), int? 'limit = (), string? cursor = ()) returns ListBreakTypesResponse|error {
        string resourcePath = string `/v2/labor/break-types`;
        map<anydata> queryParam = {"location_id": locationId, "limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBreakTypesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateBreakType
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createBreakType(CreateBreakTypeRequest payload) returns CreateBreakTypeResponse|error {
        string resourcePath = string `/v2/labor/break-types`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateBreakTypeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetBreakType
    #
    # + id - The UUID for the `BreakType` being retrieved. 
    # + return - Success 
    remote isolated function getBreakType(string id) returns GetBreakTypeResponse|error {
        string resourcePath = string `/v2/labor/break-types/${id}`;
        GetBreakTypeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateBreakType
    #
    # + id -  The UUID for the `BreakType` being updated. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateBreakType(string id, UpdateBreakTypeRequest payload) returns UpdateBreakTypeResponse|error {
        string resourcePath = string `/v2/labor/break-types/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateBreakTypeResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # DeleteBreakType
    #
    # + id - The UUID for the `BreakType` being deleted. 
    # + return - Success 
    remote isolated function deleteBreakType(string id) returns DeleteBreakTypeResponse|error {
        string resourcePath = string `/v2/labor/break-types/${id}`;
        DeleteBreakTypeResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # ListEmployeeWages
    #
    # + employeeId - Filter the returned wages to only those that are associated with the specified employee. 
    # + 'limit - The maximum number of `EmployeeWage` results to return per page. The number can range between 1 and 200. The default is 200. 
    # + cursor - A pointer to the next page of `EmployeeWage` results to fetch. 
    # + return - Success 
    remote isolated function listEmployeeWages(string? employeeId = (), int? 'limit = (), string? cursor = ()) returns ListEmployeeWagesResponse|error {
        string resourcePath = string `/v2/labor/employee-wages`;
        map<anydata> queryParam = {"employee_id": employeeId, "limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListEmployeeWagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # GetEmployeeWage
    #
    # + id - The UUID for the `EmployeeWage` being retrieved. 
    # + return - Success 
    remote isolated function getEmployeeWage(string id) returns GetEmployeeWageResponse|error {
        string resourcePath = string `/v2/labor/employee-wages/${id}`;
        GetEmployeeWageResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateShift
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createShift(CreateShiftRequest payload) returns CreateShiftResponse|error {
        string resourcePath = string `/v2/labor/shifts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateShiftResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchShifts
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchShifts(SearchShiftsRequest payload) returns SearchShiftsResponse|error {
        string resourcePath = string `/v2/labor/shifts/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchShiftsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetShift
    #
    # + id - The UUID for the `Shift` being retrieved. 
    # + return - Success 
    remote isolated function getShift(string id) returns GetShiftResponse|error {
        string resourcePath = string `/v2/labor/shifts/${id}`;
        GetShiftResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateShift
    #
    # + id - The ID of the object being updated. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateShift(string id, UpdateShiftRequest payload) returns UpdateShiftResponse|error {
        string resourcePath = string `/v2/labor/shifts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateShiftResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # DeleteShift
    #
    # + id - The UUID for the `Shift` being deleted. 
    # + return - Success 
    remote isolated function deleteShift(string id) returns DeleteShiftResponse|error {
        string resourcePath = string `/v2/labor/shifts/${id}`;
        DeleteShiftResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # ListTeamMemberWages
    #
    # + teamMemberId - Filter the returned wages to only those that are associated with the specified team member. 
    # + 'limit - The maximum number of `TeamMemberWage` results to return per page. The number can range between 1 and 200. The default is 200. 
    # + cursor - A pointer to the next page of `EmployeeWage` results to fetch. 
    # + return - Success 
    remote isolated function listTeamMemberWages(string? teamMemberId = (), int? 'limit = (), string? cursor = ()) returns ListTeamMemberWagesResponse|error {
        string resourcePath = string `/v2/labor/team-member-wages`;
        map<anydata> queryParam = {"team_member_id": teamMemberId, "limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListTeamMemberWagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # GetTeamMemberWage
    #
    # + id - The UUID for the `TeamMemberWage` being retrieved. 
    # + return - Success 
    remote isolated function getTeamMemberWage(string id) returns GetTeamMemberWageResponse|error {
        string resourcePath = string `/v2/labor/team-member-wages/${id}`;
        GetTeamMemberWageResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListWorkweekConfigs
    #
    # + 'limit - The maximum number of `WorkweekConfigs` results to return per page. 
    # + cursor - A pointer to the next page of `WorkweekConfig` results to fetch. 
    # + return - Success 
    remote isolated function listWorkweekConfigs(int? 'limit = (), string? cursor = ()) returns ListWorkweekConfigsResponse|error {
        string resourcePath = string `/v2/labor/workweek-configs`;
        map<anydata> queryParam = {"limit": 'limit, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListWorkweekConfigsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateWorkweekConfig
    #
    # + id - The UUID for the `WorkweekConfig` object being updated. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateWorkweekConfig(string id, UpdateWorkweekConfigRequest payload) returns UpdateWorkweekConfigResponse|error {
        string resourcePath = string `/v2/labor/workweek-configs/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateWorkweekConfigResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # ListLocations
    #
    # + return - Success 
    remote isolated function listLocations() returns ListLocationsResponse|error {
        string resourcePath = string `/v2/locations`;
        ListLocationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateLocation
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createLocation(CreateLocationRequest payload) returns CreateLocationResponse|error {
        string resourcePath = string `/v2/locations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateLocationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveLocation
    #
    # + locationId - The ID of the location to retrieve. If you specify the string "main", then the endpoint returns the main location. 
    # + return - Success 
    remote isolated function retrieveLocation(string locationId) returns RetrieveLocationResponse|error {
        string resourcePath = string `/v2/locations/${locationId}`;
        RetrieveLocationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateLocation
    #
    # + locationId - The ID of the location to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateLocation(string locationId, UpdateLocationRequest payload) returns UpdateLocationResponse|error {
        string resourcePath = string `/v2/locations/${locationId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateLocationResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # CreateCheckout
    #
    # + locationId - The ID of the business location to associate the checkout with. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createCheckout(string locationId, CreateCheckoutRequest payload) returns CreateCheckoutResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/checkouts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCheckoutResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListRefunds
    #
    # + locationId - The ID of the location to list refunds for. 
    # + beginTime - The beginning of the requested reporting period, in RFC 3339 format. See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity. Default value: The current time minus one year. 
    # + endTime - The end of the requested reporting period, in RFC 3339 format. See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity. Default value: The current time. 
    # + sortOrder - The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first). Default value: `DESC` 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. 
    # + return - Success 
    remote isolated function listRefundsByLocation(string locationId, string? beginTime = (), string? endTime = (), string? sortOrder = (), string? cursor = ()) returns ListRefundsResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/refunds`;
        map<anydata> queryParam = {"begin_time": beginTime, "end_time": endTime, "sort_order": sortOrder, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListRefundsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListTransactions
    #
    # + locationId - The ID of the location to list transactions for. 
    # + beginTime - The beginning of the requested reporting period, in RFC 3339 format. See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity. Default value: The current time minus one year. 
    # + endTime - The end of the requested reporting period, in RFC 3339 format. See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity. Default value: The current time. 
    # + sortOrder - The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first). Default value: `DESC` 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. 
    # + return - Success 
    remote isolated function listTransactions(string locationId, string? beginTime = (), string? endTime = (), string? sortOrder = (), string? cursor = ()) returns ListTransactionsResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/transactions`;
        map<anydata> queryParam = {"begin_time": beginTime, "end_time": endTime, "sort_order": sortOrder, "cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListTransactionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Charge
    #
    # + locationId - The ID of the location to associate the created transaction with. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function charge(string locationId, ChargeRequest payload) returns ChargeResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/transactions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChargeResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveTransaction
    #
    # + locationId - The ID of the transaction's associated location. 
    # + transactionId - The ID of the transaction to retrieve. 
    # + return - Success 
    remote isolated function retrieveTransaction(string locationId, string transactionId) returns RetrieveTransactionResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/transactions/${transactionId}`;
        RetrieveTransactionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CaptureTransaction
    #
    # + return - Success 
    remote isolated function captureTransaction(string locationId, string transactionId) returns CaptureTransactionResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/transactions/${transactionId}/capture`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CaptureTransactionResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # CreateRefund
    #
    # + locationId - The ID of the original transaction's associated location. 
    # + transactionId - The ID of the original transaction that includes the tender to refund. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function initiateRefund(string locationId, string transactionId, CreateRefundRequest payload) returns CreateRefundResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/transactions/${transactionId}/refund`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateRefundResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # VoidTransaction
    #
    # + return - Success 
    remote isolated function voidTransaction(string locationId, string transactionId) returns VoidTransactionResponse|error {
        string resourcePath = string `/v2/locations/${locationId}/transactions/${transactionId}/void`;
        http:Request request = new;
        //TODO: Update the request as needed;
        VoidTransactionResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # CreateLoyaltyAccount
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createLoyaltyAccount(CreateLoyaltyAccountRequest payload) returns CreateLoyaltyAccountResponse|error {
        string resourcePath = string `/v2/loyalty/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateLoyaltyAccountResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchLoyaltyAccounts
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchLoyaltyAccounts(SearchLoyaltyAccountsRequest payload) returns SearchLoyaltyAccountsResponse|error {
        string resourcePath = string `/v2/loyalty/accounts/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchLoyaltyAccountsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveLoyaltyAccount
    #
    # + accountId - The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) to retrieve. 
    # + return - Success 
    remote isolated function retrieveLoyaltyAccount(string accountId) returns RetrieveLoyaltyAccountResponse|error {
        string resourcePath = string `/v2/loyalty/accounts/${accountId}`;
        RetrieveLoyaltyAccountResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # AccumulateLoyaltyPoints
    #
    # + accountId - The [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) ID to which to add the points. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function accumulateLoyaltyPoints(string accountId, AccumulateLoyaltyPointsRequest payload) returns AccumulateLoyaltyPointsResponse|error {
        string resourcePath = string `/v2/loyalty/accounts/${accountId}/accumulate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccumulateLoyaltyPointsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # AdjustLoyaltyPoints
    #
    # + accountId - The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) in which to adjust the points. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function adjustLoyaltyPoints(string accountId, AdjustLoyaltyPointsRequest payload) returns AdjustLoyaltyPointsResponse|error {
        string resourcePath = string `/v2/loyalty/accounts/${accountId}/adjust`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AdjustLoyaltyPointsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchLoyaltyEvents
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchLoyaltyEvents(SearchLoyaltyEventsRequest payload) returns SearchLoyaltyEventsResponse|error {
        string resourcePath = string `/v2/loyalty/events/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchLoyaltyEventsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListLoyaltyPrograms
    #
    # + return - Success 
    remote isolated function listLoyaltyPrograms() returns ListLoyaltyProgramsResponse|error {
        string resourcePath = string `/v2/loyalty/programs`;
        ListLoyaltyProgramsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveLoyaltyProgram
    #
    # + programId - The ID of the loyalty program or the keyword `main`. Either value can be used to retrieve the single loyalty program that belongs to the seller. 
    # + return - Success 
    remote isolated function retrieveLoyaltyProgram(string programId) returns RetrieveLoyaltyProgramResponse|error {
        string resourcePath = string `/v2/loyalty/programs/${programId}`;
        RetrieveLoyaltyProgramResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CalculateLoyaltyPoints
    #
    # + programId - The [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram) ID, which defines the rules for accruing points. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function calculateLoyaltyPoints(string programId, CalculateLoyaltyPointsRequest payload) returns CalculateLoyaltyPointsResponse|error {
        string resourcePath = string `/v2/loyalty/programs/${programId}/calculate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CalculateLoyaltyPointsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # CreateLoyaltyReward
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createLoyaltyReward(CreateLoyaltyRewardRequest payload) returns CreateLoyaltyRewardResponse|error {
        string resourcePath = string `/v2/loyalty/rewards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateLoyaltyRewardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchLoyaltyRewards
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchLoyaltyRewards(SearchLoyaltyRewardsRequest payload) returns SearchLoyaltyRewardsResponse|error {
        string resourcePath = string `/v2/loyalty/rewards/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchLoyaltyRewardsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveLoyaltyReward
    #
    # + rewardId - The ID of the [loyalty reward](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyReward) to retrieve. 
    # + return - Success 
    remote isolated function retrieveLoyaltyReward(string rewardId) returns RetrieveLoyaltyRewardResponse|error {
        string resourcePath = string `/v2/loyalty/rewards/${rewardId}`;
        RetrieveLoyaltyRewardResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DeleteLoyaltyReward
    #
    # + rewardId - The ID of the [loyalty reward](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyReward) to delete. 
    # + return - Success 
    remote isolated function deleteLoyaltyReward(string rewardId) returns DeleteLoyaltyRewardResponse|error {
        string resourcePath = string `/v2/loyalty/rewards/${rewardId}`;
        DeleteLoyaltyRewardResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # RedeemLoyaltyReward
    #
    # + rewardId - The ID of the [loyalty reward](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyReward) to redeem. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function redeemLoyaltyReward(string rewardId, RedeemLoyaltyRewardRequest payload) returns RedeemLoyaltyRewardResponse|error {
        string resourcePath = string `/v2/loyalty/rewards/${rewardId}/redeem`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RedeemLoyaltyRewardResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListMerchants
    #
    # + cursor - The cursor generated by the previous response. 
    # + return - Success 
    remote isolated function listMerchants(int? cursor = ()) returns ListMerchantsResponse|error {
        string resourcePath = string `/v2/merchants`;
        map<anydata> queryParam = {"cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListMerchantsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveMerchant
    #
    # + merchantId - The ID of the merchant to retrieve. If the string "me" is supplied as the ID, then retrieve the merchant that is currently accessible to this call. 
    # + return - Success 
    remote isolated function retrieveMerchant(string merchantId) returns RetrieveMerchantResponse|error {
        string resourcePath = string `/v2/merchants/${merchantId}`;
        RetrieveMerchantResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreateOrder
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createOrder(CreateOrderRequest payload) returns CreateOrderResponse|error {
        string resourcePath = string `/v2/orders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateOrderResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BatchRetrieveOrders
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function batchRetrieveOrders(BatchRetrieveOrdersRequest payload) returns BatchRetrieveOrdersResponse|error {
        string resourcePath = string `/v2/orders/batch-retrieve`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchRetrieveOrdersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # CalculateOrder
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function calculateOrder(CalculateOrderRequest payload) returns CalculateOrderResponse|error {
        string resourcePath = string `/v2/orders/calculate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CalculateOrderResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchOrders
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchOrders(SearchOrdersRequest payload) returns SearchOrdersResponse|error {
        string resourcePath = string `/v2/orders/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchOrdersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveOrder
    #
    # + orderId - The ID of the order to retrieve. 
    # + return - Success 
    remote isolated function getOrderById(string orderId) returns RetrieveOrderResponse|error {
        string resourcePath = string `/v2/orders/${orderId}`;
        RetrieveOrderResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateOrder
    #
    # + orderId - The ID of the order to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateOrderById(string orderId, UpdateOrderRequest payload) returns UpdateOrderResponse|error {
        string resourcePath = string `/v2/orders/${orderId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateOrderResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # PayOrder
    #
    # + orderId - The ID of the order being paid. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function payOrder(string orderId, PayOrderRequest payload) returns PayOrderResponse|error {
        string resourcePath = string `/v2/orders/${orderId}/pay`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PayOrderResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # ListPayments
    #
    # + beginTime - The timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one year. 
    # + endTime - The timestamp for the end of the reporting period, in RFC 3339 format. Default: The current time. 
    # + sortOrder - The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default). 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination). 
    # + locationId - Limit results to the location supplied. By default, results are returned for the default (main) location associated with the seller. 
    # + total - The exact amount in the `total_money` for a payment. 
    # + last4 - The last four digits of a payment card. 
    # + cardBrand - The brand of the payment card (for example, VISA). 
    # + 'limit - The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page. The default value of 100 is also the maximum allowed value. If the provided value is  greater than 100, it is ignored and the default value is used instead. Default: `100` 
    # + return - Success 
    remote isolated function getPayments(string? beginTime = (), string? endTime = (), string? sortOrder = (), string? cursor = (), string? locationId = (), int? total = (), string? last4 = (), string? cardBrand = (), int? 'limit = ()) returns ListPaymentsResponse|error {
        string resourcePath = string `/v2/payments`;
        map<anydata> queryParam = {"begin_time": beginTime, "end_time": endTime, "sort_order": sortOrder, "cursor": cursor, "location_id": locationId, "total": total, "last_4": last4, "card_brand": cardBrand, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListPaymentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CreatePayment
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createPayment(CreatePaymentRequest payload) returns CreatePaymentResponse|error {
        string resourcePath = string `/v2/payments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatePaymentResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # CancelPaymentByIdempotencyKey
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function cancelPaymentByIdempotencyKey(CancelPaymentByIdempotencyKeyRequest payload) returns CancelPaymentByIdempotencyKeyResponse|error {
        string resourcePath = string `/v2/payments/cancel`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CancelPaymentByIdempotencyKeyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetPayment
    #
    # + paymentId - A unique ID for the desired payment. 
    # + return - Success 
    remote isolated function getPayment(string paymentId) returns GetPaymentResponse|error {
        string resourcePath = string `/v2/payments/${paymentId}`;
        GetPaymentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdatePayment
    #
    # + paymentId - The ID of the payment to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updatePayment(string paymentId, UpdatePaymentRequest payload) returns UpdatePaymentResponse|error {
        string resourcePath = string `/v2/payments/${paymentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdatePaymentResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # CancelPayment
    #
    # + paymentId - The ID of the payment to cancel. 
    # + return - Success 
    remote isolated function cancelPayment(string paymentId) returns CancelPaymentResponse|error {
        string resourcePath = string `/v2/payments/${paymentId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelPaymentResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # CompletePayment
    #
    # + paymentId - The unique ID identifying the payment to be completed. 
    # + return - Success 
    remote isolated function completePayment(string paymentId) returns CompletePaymentResponse|error {
        string resourcePath = string `/v2/payments/${paymentId}/complete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CompletePaymentResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # ListPaymentRefunds
    #
    # + beginTime - The timestamp for the beginning of the requested reporting period, in RFC 3339 format. Default: The current time minus one year. 
    # + endTime - The timestamp for the end of the requested reporting period, in RFC 3339 format. Default: The current time. 
    # + sortOrder - The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default). 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination). 
    # + locationId - Limit results to the location supplied. By default, results are returned for all locations associated with the seller. 
    # + status - If provided, only refunds with the given status are returned. For a list of refund status values, see [PaymentRefund](https://developer.squareup.com/reference/square_2021-08-18/objects/PaymentRefund). Default: If omitted, refunds are returned regardless of their status. 
    # + sourceType - If provided, only refunds with the given source type are returned. - `CARD` - List refunds only for payments where `CARD` was specified as the payment source. Default: If omitted, refunds are returned regardless of the source type. 
    # + 'limit - The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page. If the supplied value is greater than 100, no more than 100 results are returned. Default: 100 
    # + return - Success 
    remote isolated function listPaymentRefunds(string? beginTime = (), string? endTime = (), string? sortOrder = (), string? cursor = (), string? locationId = (), string? status = (), string? sourceType = (), int? 'limit = ()) returns ListPaymentRefundsResponse|error {
        string resourcePath = string `/v2/refunds`;
        map<anydata> queryParam = {"begin_time": beginTime, "end_time": endTime, "sort_order": sortOrder, "cursor": cursor, "location_id": locationId, "status": status, "source_type": sourceType, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListPaymentRefundsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RefundPayment
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function refundPayment(RefundPaymentRequest payload) returns RefundPaymentResponse|error {
        string resourcePath = string `/v2/refunds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RefundPaymentResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetPaymentRefund
    #
    # + refundId - The unique ID for the desired `PaymentRefund`. 
    # + return - Success 
    remote isolated function getPaymentRefund(string refundId) returns GetPaymentRefundResponse|error {
        string resourcePath = string `/v2/refunds/${refundId}`;
        GetPaymentRefundResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ListSites
    #
    # + return - Success 
    remote isolated function listSites() returns ListSitesResponse|error {
        string resourcePath = string `/v2/sites`;
        ListSitesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # RetrieveSnippet
    #
    # + siteId - The ID of the site that contains the snippet. 
    # + return - Success 
    remote isolated function retrieveSnippet(string siteId) returns RetrieveSnippetResponse|error {
        string resourcePath = string `/v2/sites/${siteId}/snippet`;
        RetrieveSnippetResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpsertSnippet
    #
    # + siteId - The ID of the site where you want to add or update the snippet. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function upsertSnippet(string siteId, UpsertSnippetRequest payload) returns UpsertSnippetResponse|error {
        string resourcePath = string `/v2/sites/${siteId}/snippet`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpsertSnippetResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # DeleteSnippet
    #
    # + siteId - The ID of the site that contains the snippet. 
    # + return - Success 
    remote isolated function deleteSnippet(string siteId) returns DeleteSnippetResponse|error {
        string resourcePath = string `/v2/sites/${siteId}/snippet`;
        DeleteSnippetResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # CreateSubscription
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createSubscription(CreateSubscriptionRequest payload) returns CreateSubscriptionResponse|error {
        string resourcePath = string `/v2/subscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateSubscriptionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchSubscriptions
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchSubscriptions(SearchSubscriptionsRequest payload) returns SearchSubscriptionsResponse|error {
        string resourcePath = string `/v2/subscriptions/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchSubscriptionsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveSubscription
    #
    # + subscriptionId - The ID of the subscription to retrieve. 
    # + return - Success 
    remote isolated function retrieveSubscription(string subscriptionId) returns RetrieveSubscriptionResponse|error {
        string resourcePath = string `/v2/subscriptions/${subscriptionId}`;
        RetrieveSubscriptionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateSubscription
    #
    # + subscriptionId - The ID for the subscription to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateSubscription(string subscriptionId, UpdateSubscriptionRequest payload) returns UpdateSubscriptionResponse|error {
        string resourcePath = string `/v2/subscriptions/${subscriptionId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateSubscriptionResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # CancelSubscription
    #
    # + subscriptionId - The ID of the subscription to cancel. 
    # + return - Success 
    remote isolated function cancelSubscription(string subscriptionId) returns CancelSubscriptionResponse|error {
        string resourcePath = string `/v2/subscriptions/${subscriptionId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelSubscriptionResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # ListSubscriptionEvents
    #
    # + subscriptionId - The ID of the subscription to retrieve the events for. 
    # + cursor - A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination). 
    # + 'limit - The upper limit on the number of subscription events to return in the response. Default: `200` 
    # + return - Success 
    remote isolated function listSubscriptionEvents(string subscriptionId, string? cursor = (), int? 'limit = ()) returns ListSubscriptionEventsResponse|error {
        string resourcePath = string `/v2/subscriptions/${subscriptionId}/events`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListSubscriptionEventsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # ResumeSubscription
    #
    # + subscriptionId - The ID of the subscription to resume. 
    # + return - Success 
    remote isolated function resumeSubscription(string subscriptionId) returns ResumeSubscriptionResponse|error {
        string resourcePath = string `/v2/subscriptions/${subscriptionId}/resume`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ResumeSubscriptionResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # CreateTeamMember
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createTeamMember(CreateTeamMemberRequest payload) returns CreateTeamMemberResponse|error {
        string resourcePath = string `/v2/team-members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateTeamMemberResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BulkCreateTeamMembers
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function bulkCreateTeamMembers(BulkCreateTeamMembersRequest payload) returns BulkCreateTeamMembersResponse|error {
        string resourcePath = string `/v2/team-members/bulk-create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkCreateTeamMembersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # BulkUpdateTeamMembers
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function bulkUpdateTeamMembers(BulkUpdateTeamMembersRequest payload) returns BulkUpdateTeamMembersResponse|error {
        string resourcePath = string `/v2/team-members/bulk-update`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkUpdateTeamMembersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchTeamMembers
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchTeamMembers(SearchTeamMembersRequest payload) returns SearchTeamMembersResponse|error {
        string resourcePath = string `/v2/team-members/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchTeamMembersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # RetrieveTeamMember
    #
    # + teamMemberId - The ID of the team member to retrieve. 
    # + return - Success 
    remote isolated function retrieveTeamMember(string teamMemberId) returns RetrieveTeamMemberResponse|error {
        string resourcePath = string `/v2/team-members/${teamMemberId}`;
        RetrieveTeamMemberResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateTeamMember
    #
    # + teamMemberId - The ID of the team member to update. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateTeamMember(string teamMemberId, UpdateTeamMemberRequest payload) returns UpdateTeamMemberResponse|error {
        string resourcePath = string `/v2/team-members/${teamMemberId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateTeamMemberResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # RetrieveWageSetting
    #
    # + teamMemberId - The ID of the team member for which to retrieve the wage setting. 
    # + return - Success 
    remote isolated function retrieveWageSetting(string teamMemberId) returns RetrieveWageSettingResponse|error {
        string resourcePath = string `/v2/team-members/${teamMemberId}/wage-setting`;
        RetrieveWageSettingResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # UpdateWageSetting
    #
    # + teamMemberId - The ID of the team member for which to update the `WageSetting` object. 
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function updateWageSetting(string teamMemberId, UpdateWageSettingRequest payload) returns UpdateWageSettingResponse|error {
        string resourcePath = string `/v2/team-members/${teamMemberId}/wage-setting`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateWageSettingResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # CreateTerminalCheckout
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createTerminalCheckout(CreateTerminalCheckoutRequest payload) returns CreateTerminalCheckoutResponse|error {
        string resourcePath = string `/v2/terminals/checkouts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateTerminalCheckoutResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchTerminalCheckouts
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchTerminalCheckouts(SearchTerminalCheckoutsRequest payload) returns SearchTerminalCheckoutsResponse|error {
        string resourcePath = string `/v2/terminals/checkouts/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchTerminalCheckoutsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetTerminalCheckout
    #
    # + checkoutId - The unique ID for the desired `TerminalCheckout`. 
    # + return - Success 
    remote isolated function getTerminalCheckout(string checkoutId) returns GetTerminalCheckoutResponse|error {
        string resourcePath = string `/v2/terminals/checkouts/${checkoutId}`;
        GetTerminalCheckoutResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CancelTerminalCheckout
    #
    # + checkoutId - The unique ID for the desired `TerminalCheckout`. 
    # + return - Success 
    remote isolated function cancelTerminalCheckout(string checkoutId) returns CancelTerminalCheckoutResponse|error {
        string resourcePath = string `/v2/terminals/checkouts/${checkoutId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelTerminalCheckoutResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # CreateTerminalRefund
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function createTerminalRefund(CreateTerminalRefundRequest payload) returns CreateTerminalRefundResponse|error {
        string resourcePath = string `/v2/terminals/refunds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateTerminalRefundResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # SearchTerminalRefunds
    #
    # + payload - An object containing the fields to POST for the request. 
    # + return - Success 
    remote isolated function searchTerminalRefunds(SearchTerminalRefundsRequest payload) returns SearchTerminalRefundsResponse|error {
        string resourcePath = string `/v2/terminals/refunds/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchTerminalRefundsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # GetTerminalRefund
    #
    # + terminalRefundId - The unique ID for the desired `TerminalRefund`. 
    # + return - Success 
    remote isolated function getTerminalRefund(string terminalRefundId) returns GetTerminalRefundResponse|error {
        string resourcePath = string `/v2/terminals/refunds/${terminalRefundId}`;
        GetTerminalRefundResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # CancelTerminalRefund
    #
    # + terminalRefundId - The unique ID for the desired `TerminalRefund`. 
    # + return - Success 
    remote isolated function cancelTerminalRefund(string terminalRefundId) returns CancelTerminalRefundResponse|error {
        string resourcePath = string `/v2/terminals/refunds/${terminalRefundId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelTerminalRefundResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
