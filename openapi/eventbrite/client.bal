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

# This is a generated connector for [Eventbrite API v3](https://www.eventbrite.com/platform/api) OpenAPI specification.
# Eventbrite is an Event Management System with an API which allows creating and managing events including venue management, marketing, selling tickets, and financial management.
@display {label: "Eventbrite", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Eventbrite account](https://www.eventbrite.com/platform) and obtain tokens by following [this guide](https://www.eventbrite.com/platform/api#/introduction/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://www.eventbriteapi.com/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a list of the organizations to which you are a member. Returns a paginated response.
    #
    # + return - An object with a single property organizations which is an array of Organization objects. 
    remote isolated function listOrganizations() returns Organizations|error {
        string resourcePath = string `/users/me/organizations/`;
        Organizations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the list organizations by user ID. Returns a paginated response.
    #
    # + userId - ID of User. Example: 12345. 
    # + return - An object with a single property organizations which is an array of Organization objects. 
    remote isolated function listOrganizationsByUser(string userId) returns Organizations|error {
        string resourcePath = string `/users/${userId}/organizations/`;
        Organizations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Events by Organization ID. Returns a paginated response.
    #
    # + organizationId - Organization ID Example: 12345. 
    # + nameFilter - Filter Organization's Events by specified name. 
    # + currencyFilter - Filter Organization's Events by specified currency. 
    # + orderBy - Sort order for the list of Events. 
    # + seriesFilter - Filter based on whether an event is not a series, a series, child series or parent series. This filter has higher precedence than show series parent filter. Default will use show series parent filter behavior. 
    # + showSeriesParent - false (Default) = In the list, show the series children and not series parent. true = In the list, show the series parent instead of series. 
    # + status - Filter Organization's Events by status. Specify multiple status values as a comma delimited 
    # + eventGroupId - Filter Organization's Events by event_group_id. 
    # + collectionId - Filter Organization's Events by collection_id. 
    # + pageSize - Number of records to display on each page of the list. 
    # + timeFilter - Limits the list results to either past or current and future Events. 
    # + inventoryTypeFilter - Filter Organization's Events by Inventory Type. 
    # + eventIdsToExclude - IDs of events to exclude from the Organization's Events list. 
    # + collectionIdsToExclude - IDs of collections to exclude from the Organization's Events list. This will have precedence over event_group_id filter and collection_id filter. 
    # + return - An object with a property events which is an array of Event objects. 
    remote isolated function listEventsByOrganization(string organizationId, string? nameFilter = (), string? currencyFilter = (), string? orderBy = (), boolean? seriesFilter = (), boolean? showSeriesParent = (), string? status = (), string? eventGroupId = (), string? collectionId = (), decimal? pageSize = (), string? timeFilter = (), string? inventoryTypeFilter = (), string? eventIdsToExclude = (), string? collectionIdsToExclude = ()) returns EventsByOrganization|error {
        string resourcePath = string `/organizations/${organizationId}/events/`;
        map<anydata> queryParam = {"name_filter": nameFilter, "currency_filter": currencyFilter, "order_by": orderBy, "series_filter": seriesFilter, "show_series_parent": showSeriesParent, "status": status, "event_group_id": eventGroupId, "collection_id": collectionId, "page_size": pageSize, "time_filter": timeFilter, "inventory_type_filter": inventoryTypeFilter, "event_ids_to_exclude": eventIdsToExclude, "collection_ids_to_exclude": collectionIdsToExclude};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EventsByOrganization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new Event.
    #
    # + organizationId - ID of the Organization that owns the Event. Example: 12345. 
    # + payload - An object with a single property event which must be an Event object. 
    # + return - Created new Event 
    remote isolated function createEvent(string organizationId, CreateEventRequest payload) returns CreatedEvent|error {
        string resourcePath = string `/organizations/${organizationId}/events/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedEvent response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Publish an Event.
    #
    # + eventId - Event ID. Example: 12345. 
    # + return - Published event status 
    remote isolated function publishEvent(string eventId) returns PublishedEvent|error {
        string resourcePath = string `/events/${eventId}/publish/`;
        http:Request request = new;
        //TODO: Update the request as needed;
        PublishedEvent response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List Discounts by Organization ID. Returns a paginated response.
    #
    # + organizationId - Organization ID. Example: 12345. 
    # + scope - Discount scope. Example: event 
    # + codeFilter - Filter Discounts by approximate match code or name 
    # + code - Filter Discount by exact match code or name. Example: abcde 
    # + pageSize - Number of records to display on each returned page. 
    # + 'type - Discount type 
    # + ticketGroupId - Filter Discounts by Ticket Group ID. Example: 12345 
    # + eventId - Filter Discounts by Event ID. Required for the event scope. Example: 12345 
    # + orderBy - Response order. 
    # + holdIds - Filter discounts to only those that apply to specified hold IDs. IDs are in composite id format for either hold class (H123) or hold inventory tier (I123) 
    # + return - An object with a property discounts which is an array of Discount objects. 
    remote isolated function listDiscounts(string organizationId, string? scope = (), string? codeFilter = (), string? code = (), decimal? pageSize = (), string? 'type = (), string? ticketGroupId = (), string? eventId = (), string? orderBy = (), string? holdIds = ()) returns Discounts|error {
        string resourcePath = string `/organizations/${organizationId}/discounts/`;
        map<anydata> queryParam = {"scope": scope, "code_filter": codeFilter, "code": code, "page_size": pageSize, "type": 'type, "ticket_group_id": ticketGroupId, "event_id": eventId, "order_by": orderBy, "hold_ids": holdIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Discounts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new Discount.
    #
    # + organizationId - ID of the Organization that owns the Event. Example: 12345. 
    # + payload - An object with a single property discount which must be an Discount object. 
    # + return - Created new Discount 
    remote isolated function createDiscount(string organizationId, CreateDiscountRequest payload) returns CreatedDiscount|error {
        string resourcePath = string `/organizations/${organizationId}/discounts/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a new Ticket Class.
    #
    # + eventId - Event ID. Example: 12345. 
    # + payload - An object with a single property ticket_class which must be an TicketClass object. 
    # + return - Created ticket class 
    remote isolated function createTicketClass(string eventId, CreateTicketClassRequest payload) returns CreatedTicketClass|error {
        string resourcePath = string `/events/${eventId}/ticket_classes/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedTicketClass response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of Category as categories, including subcategories nested. Returns a paginated response.
    #
    # + return - An object with a single property categories which is an array of Category objects. 
    remote isolated function listCategories() returns Categories|error {
        string resourcePath = string `/categories/`;
        Categories response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Events by Venue ID. Returns a paginated response.
    #
    # + venueId - Venue ID. Example: 12345. 
    # + status - Filter Events at the Venue by status. Specify multiple status values as a comma delimited string. Example: live. 
    # + orderBy - Sort order of list of Events at the Venue. Example: start_asc. 
    # + startDate - Filter Events at the Venue by a specified date range. 
    # + onlyPublic - True = Filter public Events at the Venue. Example: true 
    # + return - An object with a property events which is an array of Event objects. 
    remote isolated function listEventsByVenue(string venueId, string? status = (), string? orderBy = (), string? startDate = (), boolean? onlyPublic = ()) returns EventsByVenue|error {
        string resourcePath = string `/venues/${venueId}/events/`;
        map<anydata> queryParam = {"status": status, "order_by": orderBy, "start_date": startDate, "only_public": onlyPublic};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EventsByVenue response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Information about a User Account.
    #
    # + userId - User ID. Example: 12345. 
    # + return - An object with a property user which is a User object. 
    remote isolated function getUserDetails(string userId) returns UserObject|error {
        string resourcePath = string `/users/${userId}/`;
        UserObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a paginated response of orders, under the key orders, of orders placed against any of the events the organization owns (events that would be returned from /organizations/:id/events/).
    #
    # + organizationId - Organization ID. Example: 12345. 
    # + status - Filter Event's Order by status. Example: active 
    # + changedSince - Only return orders changed on or after the time given. 
    # + onlyEmails - Only include orders placed by one of these emails. 
    # + excludeEmails - Don't include orders placed by any of these emails 
    # + return - An object with a property orders which is an array of Order objects. 
    remote isolated function listOrdersByOrganization(string organizationId, string? status = (), string? changedSince = (), string? onlyEmails = (), boolean? excludeEmails = ()) returns OrdersByOrganization|error {
        string resourcePath = string `/organizations/${organizationId}/orders/`;
        map<anydata> queryParam = {"status": status, "changed_since": changedSince, "only_emails": onlyEmails, "exclude_emails": excludeEmails};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrdersByOrganization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Orders by Event ID. Returns a paginated response.
    #
    # + eventId - Event ID. Example: 12345. 
    # + status - Filter Event's Order by status. Example: active 
    # + changedSince - Orders changed on or after this time. 
    # + lastItemSeen - Orders changed on or after this time, and with an ID larger than last item seen. 
    # + onlyEmails - Orders placed by this email address 
    # + excludeEmails - Orders placed by this email address are not included in return 
    # + refundRequestStatuses - Only Orders with specified refund request status are included in return. 
    # + return - An object with a property orders which is an array of Order objects. 
    remote isolated function listOrdersByEvent(string eventId, string? status = (), string? changedSince = (), string? lastItemSeen = (), boolean? onlyEmails = (), string? excludeEmails = (), string? refundRequestStatuses = ()) returns OrdersByEvent|error {
        string resourcePath = string `/events/${eventId}/orders/`;
        map<anydata> queryParam = {"status": status, "changed_since": changedSince, "last_item_seen": lastItemSeen, "only_emails": onlyEmails, "exclude_emails": excludeEmails, "refund_request_statuses": refundRequestStatuses};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrdersByEvent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Orders by User ID. Returns a paginated response.
    #
    # + userId - User ID. Example: 12345. 
    # + changedSince - Orders changed on or after this time. 
    # + timeFilter - Filter the list to only, or all, past or current and future Orders. 
    # + return - An object with a property orders which is an array of Order objects. 
    remote isolated function listOrdersByUser(string userId, string? changedSince = (), string? timeFilter = ()) returns OrdersByOrganization|error {
        string resourcePath = string `/users/${userId}/orders/`;
        map<anydata> queryParam = {"changed_since": changedSince, "time_filter": timeFilter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrdersByOrganization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Attendees of an Organization's Events by Organization ID. Returns a paginated response.
    #
    # + organizationId - Organization ID. Example: 12345. 
    # + status - Filter Attendees by status of either attending or not_attending 
    # + changedSince - Filter Attendees by resource changed on or after the time given. 
    # + return - An object with a property attendees which is an array of Attendee objects. 
    remote isolated function listAttendees(string organizationId, string? status = (), string? changedSince = ()) returns AttendeesByOrganization|error {
        string resourcePath = string `/organizations/${organizationId}/attendees/`;
        map<anydata> queryParam = {"status": status, "changed_since": changedSince};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AttendeesByOrganization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Attendees by Event ID. Returns a paginated response.
    #
    # + eventId - Event ID. Example: 12345. 
    # + status - Filter Attendees by status of either attending, not attending or unpaid 
    # + changedSince - Filter Attendees changed on or after the specified time. 
    # + lastItemSeen - When passed in conjunction with changed_since, filter Attendees changed on or after the specified time and with an ID later than the value of thelast_item_seen field. 
    # + attendeeIds - Filter Attendees with the specified IDs 
    # + return - An object with a property attendees which is an array of Attendee objects. 
    remote isolated function listAttendeesByEvent(string eventId, string? status = (), string? changedSince = (), string? lastItemSeen = (), boolean? attendeeIds = ()) returns AttendeesByEvent|error {
        string resourcePath = string `/events/${eventId}/attendees/`;
        map<anydata> queryParam = {"status": status, "changed_since": changedSince, "last_item_seen": lastItemSeen, "attendee_ids": attendeeIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AttendeesByEvent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an Attendee by Attendee ID.
    #
    # + eventId - Event ID. Example: 12345. 
    # + attendeeId - Attendee ID. Example: 12345. 
    # + return - An object which is an Attendee object. 
    remote isolated function getAttendeeDetails(string eventId, string attendeeId) returns Attendee|error {
        string resourcePath = string `/events/${eventId}/attendees/${attendeeId}/`;
        Attendee response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Venues by Organization ID. Returns a paginated response.
    #
    # + organizationId - Organization ID. Example: 12345. 
    # + return - An object with a property venues which is an array of Venue objects. 
    remote isolated function listVenues(string organizationId) returns Venues|error {
        string resourcePath = string `/organizations/${organizationId}/venues/`;
        Venues response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create new Venue under an Organization.
    #
    # + organizationId - ID of the Organization that owns the Event. Example: 12345. 
    # + payload - An object with a single property venue which must be a Venue object. 
    # + return - Created Venue 
    remote isolated function createVenue(string organizationId, CreateVenueRequest payload) returns CreatedVenue|error {
        string resourcePath = string `/organizations/${organizationId}/venues/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedVenue response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of teams for the event. Returns a paginated response.
    #
    # + eventId - Event ID. Example: 12345. 
    # + return - An object with a property teams which is an array of Team objects. 
    remote isolated function listTeams(string eventId) returns Teams|error {
        string resourcePath = string `/events/${eventId}/teams/`;
        Teams response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns attendee for a single team. Returns a paginated response.
    #
    # + eventId - Event ID. Example: 12345. 
    # + teamId - Team ID. Example: 12345. 
    # + return - An object with a property attendees which is an array of Attendee objects. 
    remote isolated function listAttendeesByTeam(string eventId, string teamId) returns Attendees|error {
        string resourcePath = string `/events/${eventId}/teams/${teamId}/attendees/`;
        Attendees response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns information for a single team.
    #
    # + eventId - Event ID. Example: 12345. 
    # + teamId - Team ID. Example: 1. 
    # + return - An object which is a Team object. 
    remote isolated function getTeamDetails(string eventId, string teamId) returns Team|error {
        string resourcePath = string `/events/${eventId}/teams/${teamId}/`;
        Team response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve an Event by Event ID.
    #
    # + eventId - Event ID. Example: 12345. 
    # + return - An object which is an Event object. 
    remote isolated function getEventDetails(string eventId) returns EventObject|error {
        string resourcePath = string `/events/${eventId}/`;
        EventObject response = check self.clientEp->get(resourcePath);
        return response;
    }
}
