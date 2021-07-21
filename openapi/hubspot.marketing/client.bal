import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) to get information on obtaining API key
#
# + apiKeys - Provide your PAT token as `hapikey`. Eg: `{"hapikey" : "<API key>"}` 
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# These APIs allow you to interact with HubSpot's Marketing Events Extension. 
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Create a marketing event
    #
    # + payload - The details of the marketing event to create
    # + return - successful operation
    remote isolated function createMarketingEvent(MarketingEventCreateRequestParams payload) returns MarketingEventDefaultResponse|error {
        string  path = string `/marketing/v3/marketing-events-beta/events`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MarketingEventDefaultResponse response = check self.clientEp->post(path, request, targetType=MarketingEventDefaultResponse);
        return response;
    }
    # Delete multiple marketing events
    #
    # + payload - The details of the marketing events to delete
    # + return - An error occurred.
    remote isolated function posteventsDelete(BatchInputMarketingEventExternalUniqueIdentifier payload) returns Error|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/delete`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Error response = check self.clientEp->post(path, request, targetType=Error);
        return response;
    }
    # Search for marketing events
    #
    # + q - The partial event id to search for
    # + return - successful operation
    remote isolated function eventsSearch(string q) returns CollectionResponseMarketingEventExternalUniqueIdentifierNoPaging|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/search`;
        map<anydata> queryParam = {"q": q, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseMarketingEventExternalUniqueIdentifierNoPaging response = check self.clientEp-> get(path, targetType = CollectionResponseMarketingEventExternalUniqueIdentifierNoPaging);
        return response;
    }
    # Create or update multiple marketing events
    #
    # + payload - The details of the marketing events to upsert
    # + return - successful operation
    remote isolated function eventsCreateOrUpsert(BatchInputMarketingEventCreateRequestParams payload) returns BatchResponseMarketingEventPublicDefaultResponse|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/upsert`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseMarketingEventPublicDefaultResponse response = check self.clientEp->post(path, request, targetType=BatchResponseMarketingEventPublicDefaultResponse);
        return response;
    }
    # Get a marketing event
    #
    # + externalEventId - The id of the marketing event to return
    # + externalAccountId - The account id associated with the marketing event
    # + return - successful operation
    remote isolated function getEventsExternaleventid(string externalEventId, string externalAccountId) returns MarketingEventPublicReadResponse|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        MarketingEventPublicReadResponse response = check self.clientEp-> get(path, targetType = MarketingEventPublicReadResponse);
        return response;
    }
    # Create or update a marketing event
    #
    # + externalEventId - The id of the marketing event to upsert
    # + payload - The details of the marketing event to upsert
    # + return - successful operation
    remote isolated function updateEventsExternaleventid(string externalEventId, MarketingEventCreateRequestParams payload) returns MarketingEventPublicDefaultResponse|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MarketingEventPublicDefaultResponse response = check self.clientEp->put(path, request, targetType=MarketingEventPublicDefaultResponse);
        return response;
    }
    # Delete a marketing event
    #
    # + externalEventId - The id of the marketing event to delete
    # + externalAccountId - The account id associated with the marketing event
    # + return - No content
    remote isolated function deleteEventsExternaleventid(string externalEventId, string externalAccountId) returns http:Response|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a marketing event
    #
    # + externalEventId - The id of the marketing event to update
    # + externalAccountId - The account id associated with the marketing event
    # + payload - The details of the marketing event to update
    # + return - successful operation
    remote isolated function updateEvents(string externalEventId, string externalAccountId, MarketingEventUpdateRequestParams payload) returns MarketingEventPublicDefaultResponse|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MarketingEventPublicDefaultResponse response = check self.clientEp->patch(path, request, targetType=MarketingEventPublicDefaultResponse);
        return response;
    }
    # Mark a marketing event as cancelled
    #
    # + externalEventId - The id of the marketing event to mark as cancelled
    # + externalAccountId - The account id associated with the marketing event
    # + return - successful operation
    remote isolated function eventsExternaleventidCancel(string externalEventId, string externalAccountId) returns MarketingEventDefaultResponse|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}/cancel`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        MarketingEventDefaultResponse response = check self.clientEp-> post(path, request, targetType = MarketingEventDefaultResponse);
        return response;
    }
    # Record
    #
    # + externalEventId - The id of the marketing event
    # + subscriberState - The new subscriber state for the HubSpot contacts and the specified marketing event
    # + externalAccountId - The account id associated with the marketing event
    # + payload - The details of the contacts to subscribe to the event
    # + return - An error occurred.
    remote isolated function externaleventidSubscriberstateEmailUpsert(string externalEventId, string subscriberState, string externalAccountId, BatchInputMarketingEventEmailSubscriber payload) returns Error|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}/${subscriberState}/email-upsert`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Error response = check self.clientEp->post(path, request, targetType=Error);
        return response;
    }
    # Record
    #
    # + externalEventId - The id of the marketing event
    # + subscriberState - The new subscriber state for the HubSpot contacts and the specified marketing event
    # + externalAccountId - The account id associated with the marketing event
    # + payload - The details of the contacts to subscribe to the event
    # + return - An error occurred.
    remote isolated function eventsExternaleventidSubscriberstateUpsert(string externalEventId, string subscriberState, string externalAccountId, BatchInputMarketingEventSubscriber payload) returns Error|error {
        string  path = string `/marketing/v3/marketing-events-beta/events/${externalEventId}/${subscriberState}/upsert`;
        map<anydata> queryParam = {"externalAccountId": externalAccountId, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Error response = check self.clientEp->post(path, request, targetType=Error);
        return response;
    }
    # Retrieve the application settings
    #
    # + appId - The id of the application to retrieve the settings for.
    # + return - successful operation
    remote isolated function getAppidSettings(int appId) returns EventDetailSettings|error {
        string  path = string `/marketing/v3/marketing-events-beta/${appId}/settings`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        EventDetailSettings response = check self.clientEp-> get(path, targetType = EventDetailSettings);
        return response;
    }
    # Update the application settings
    #
    # + appId - The id of the application to update the settings for.
    # + payload - The new application settings
    # + return - successful operation
    remote isolated function postAppidSettings(int appId, EventDetailSettingsUrl payload) returns EventDetailSettings|error {
        string  path = string `/marketing/v3/marketing-events-beta/${appId}/settings`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EventDetailSettings response = check self.clientEp->post(path, request, targetType=EventDetailSettings);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
