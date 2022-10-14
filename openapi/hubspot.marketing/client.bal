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
    # Represents API Key `hapikey`
    string hapikey;
|};

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# These APIs allow you to interact with HubSpot's Marketing Events Extension.
@display {label: "HubSpot Marketing", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain the API Key following [this guide](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.162640933).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Create a marketing event
    #
    # + payload - The details of the marketing event to create 
    # + return - successful operation 
    remote isolated function createMarketingEvent(MarketingEventCreateRequest payload) returns MarketingEventDefaultResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MarketingEventDefaultResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete multiple marketing events
    #
    # + payload - The details of the marketing events to delete 
    # + return - An error occurred. 
    remote isolated function posteventsDelete(MarketingEventExternalUniqueIdentifierBatch payload) returns http:Response|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/delete`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search for marketing events
    #
    # + q - The partial event id to search for 
    # + return - successful operation 
    remote isolated function eventsSearch(string q) returns MarketingEventSearchResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/search`;
        map<anydata> queryParam = {"q": q, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MarketingEventSearchResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create or update multiple marketing events
    #
    # + payload - The details of the marketing events to upsert 
    # + return - successful operation 
    remote isolated function eventsCreateOrUpsert(MarketingEventBatchCreateRequest payload) returns MarketingEventCollectionResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/upsert`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MarketingEventCollectionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a marketing event
    #
    # + externalEventId - The id of the marketing event to return 
    # + externalAccountId - The account id associated with the marketing event 
    # + return - successful operation 
    remote isolated function getEventsExternaleventid(string externalEventId, string externalAccountId) returns PublicMarketingEventReadResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PublicMarketingEventReadResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create or update a marketing event
    #
    # + externalEventId - The id of the marketing event to upsert 
    # + payload - The details of the marketing event to upsert 
    # + return - successful operation 
    remote isolated function updateEventsExternaleventid(string externalEventId, MarketingEventCreateRequest payload) returns PublicMarketingEventResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicMarketingEventResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a marketing event
    #
    # + externalEventId - The id of the marketing event to delete 
    # + externalAccountId - The account id associated with the marketing event 
    # + return - No content 
    remote isolated function deleteEventsExternaleventid(string externalEventId, string externalAccountId) returns http:Response|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a marketing event
    #
    # + externalEventId - The id of the marketing event to update 
    # + externalAccountId - The account id associated with the marketing event 
    # + payload - The details of the marketing event to update 
    # + return - successful operation 
    remote isolated function updateEvents(string externalEventId, string externalAccountId, MarketingEventUpdateRequest payload) returns PublicMarketingEventResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicMarketingEventResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Mark a marketing event as cancelled
    #
    # + externalEventId - The id of the marketing event to mark as cancelled 
    # + externalAccountId - The account id associated with the marketing event 
    # + return - successful operation 
    remote isolated function eventsExternaleventidCancel(string externalEventId, string externalAccountId) returns MarketingEventDefaultResponse|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}/cancel`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        MarketingEventDefaultResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Record
    #
    # + externalEventId - The id of the marketing event 
    # + subscriberState - The new subscriber state for the HubSpot contacts and the specified marketing event 
    # + externalAccountId - The account id associated with the marketing event 
    # + payload - The details of the contacts to subscribe to the event 
    # + return - An error occurred. 
    remote isolated function externaleventidSubscriberstateEmailUpsert(string externalEventId, string subscriberState, string externalAccountId, MarketingEventEmailSubscriberBatch payload) returns http:Response|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}/${getEncodedUri(subscriberState)}/email-upsert`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Record
    #
    # + externalEventId - The id of the marketing event 
    # + subscriberState - The new subscriber state for the HubSpot contacts and the specified marketing event 
    # + externalAccountId - The account id associated with the marketing event 
    # + payload - The details of the contacts to subscribe to the event 
    # + return - An error occurred. 
    remote isolated function eventsExternaleventidSubscriberstateUpsert(string externalEventId, string subscriberState, string externalAccountId, MarketingEventSubscriberBatch payload) returns http:Response|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/events/${getEncodedUri(externalEventId)}/${getEncodedUri(subscriberState)}/upsert`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, "hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve the application settings
    #
    # + appId - The id of the application to retrieve the settings for. 
    # + return - successful operation 
    remote isolated function getAppidSettings(int appId) returns EventDetailSettings|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/${getEncodedUri(appId)}/settings`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EventDetailSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the application settings
    #
    # + appId - The id of the application to update the settings for. 
    # + payload - The new application settings 
    # + return - successful operation 
    remote isolated function postAppidSettings(int appId, EventDetailSettingsUrl payload) returns EventDetailSettings|error {
        string resourcePath = string `/marketing/v3/marketing-events-beta/${getEncodedUri(appId)}/settings`;
        map<anydata> queryParam = {"hapikey": self.apiKeyConfig.hapikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventDetailSettings response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
