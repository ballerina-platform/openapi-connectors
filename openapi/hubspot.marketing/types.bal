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

public type MarketingEventBatchCreateRequest record {
    MarketingEventCreateRequest[] inputs;
};

public type StandardError record {
    string status;
    string id?;
    ErrorCategory category;
    record {} subCategory?;
    string message;
    ErrorDetail[] errors;
    record {} context;
    record {} links;
};

public type MarketingEventExternalUniqueIdentifierBatch record {
    MarketingEventExternalUniqueIdentifier[] inputs;
};

# Maketing event read response
public type PublicMarketingEventReadResponse record {
    # The name of the marketing event.
    string eventName;
    # The type of the marketing event.
    string eventType?;
    # The start date and time of the marketing event.
    string startDateTime?;
    # The end date and time of the marketing event.
    string endDateTime?;
    # The name of the organizer of the marketing event.
    string eventOrganizer;
    # The description of the marketing event.
    string eventDescription?;
    # A URL in the external event application where the marketing event can be managed.
    string eventUrl?;
    # Indicates if the marketing event has been cancelled.
    boolean eventCancelled?;
    # A list of PropertyValues. These can be whatever kind of property names and values you want. However, they must already exist on the HubSpot account's definition of the MarketingEvent Object. If they don't they will be filtered out and not set.
    # In order to do this you'll need to create a new PropertyGroup on the HubSpot account's MarketingEvent object for your specific app and create the Custom Property you want to track on that HubSpot account. Do not create any new default properties on the MarketingEvent object as that will apply to all HubSpot accounts.
    PropertyValue[] customProperties;
    # The id of the marketing event in the external event application.
    string externalEventId;
    # The number of HubSpot contacts that registered for this marketing event.
    int registrants;
    # The number of HubSpot contacts that attended this marketing event.
    int attendees;
    # The number of HubSpot contacts that registered for this marketing event, but later cancelled their registration.
    int cancellations;
    # The number of HubSpot contacts that registered for this marketing event, but did not attend. This field only had a value when the event is over.
    int noShows;
    # Created date/time
    string createdAt;
    # Updated date/time
    string updatedAt;
    # ID
    string id;
};

# Marketing event update parameters
public type MarketingEventUpdateRequest record {
    # The name of the marketing event.
    string eventName?;
    # Describes what type of event this is.  For example: `WEBINAR`, `CONFERENCE`, `WORKSHOP`
    string eventType?;
    # The start date and time of the marketing event.
    string startDateTime?;
    # The end date and time of the marketing event.
    string endDateTime?;
    # The name of the organizer of the marketing event.
    string eventOrganizer?;
    # The description of the marketing event.
    string eventDescription?;
    # A URL in the external event application where the marketing event can be managed.
    string eventUrl?;
    # Indicates if the marketing event has been cancelled. Defaults to `false`
    boolean eventCancelled?;
    # A list of PropertyValues. These can be whatever kind of property names and values you want. However, they must already exist on the HubSpot account's definition of the MarketingEvent Object. If they don't they will be filtered out and not set.
    # In order to do this you'll need to create a new PropertyGroup on the HubSpot account's MarketingEvent object for your specific app and create the Custom Property you want to track on that HubSpot account. Do not create any new default properties on the MarketingEvent object as that will apply to all HubSpot accounts.
    PropertyValue[] customProperties;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

public type PropertyValue record {
    string name;
    string value;
    int timestamp;
    string sourceId;
    string sourceLabel;
    string 'source;
    boolean selectedByUser;
    int selectedByUserTimestamp;
    int[] sourceVid;
    # Source metadata encoded as a base64 string. For example: `ZXhhbXBsZSBzdHJpbmc=`
    string sourceMetadata;
    string requestId;
    int updatedByUserId;
};

# Event detail settings
public type EventDetailSettings record {
    # The id of the application the settings are for
    int appId;
    # The url that will be used to fetch marketing event details by id
    string eventDetailsUrl;
};

# Marketing event subscriber
public type MarketingEventSubscriber record {
    # The date and time at which the contact subscribed to the event.
    int interactionDateTime;
    # VID
    int vid;
};

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

# Marketing event email subscriber
public type MarketingEventEmailSubscriber record {
    # The date and time at which the contact subscribed to the event.
    int interactionDateTime;
    # The email address of the contact in HubSpot to associate with the event. Note that the contact must already exist in HubSpot; a contact will not be created.
    string email;
};

public type ErrorCategory record {
    string httpStatus;
    string name;
};

# Event detail URL
public type EventDetailSettingsUrl record {
    # The url that will be used to fetch marketing event details by id. Must contain a `%s` character sequence that will be substituted with the event id. For example: `https://my.event.app/events/%s`
    string eventDetailsUrl;
};

# Public marketing event  info
public type PublicMarketingEventResponse record {
    # The name of the marketing event.
    string eventName;
    # The type of the marketing event.
    string eventType?;
    # The start date and time of the marketing event.
    string startDateTime?;
    # The end date and time of the marketing event.
    string endDateTime?;
    # The name of the organizer of the marketing event.
    string eventOrganizer;
    # The description of the marketing event.
    string eventDescription?;
    # A URL in the external event application where the marketing event can be managed.
    string eventUrl?;
    # Indicates if the marketing event has been cancelled.
    boolean eventCancelled?;
    # A list of PropertyValues. These can be whatever kind of property names and values you want. However, they must already exist on the HubSpot account's definition of the MarketingEvent Object. If they don't they will be filtered out and not set.
    # In order to do this you'll need to create a new PropertyGroup on the HubSpot account's MarketingEvent object for your specific app and create the Custom Property you want to track on that HubSpot account. Do not create any new default properties on the MarketingEvent object as that will apply to all HubSpot accounts.
    PropertyValue[] customProperties;
    # ID
    string id;
    # Created date/time
    string createdAt;
    # Updated date/time
    string updatedAt;
};

# Marketing event
public type MarketingEventCreateRequest record {
    # The name of the marketing event.
    string eventName;
    # Describes what type of event this is.  For example: `WEBINAR`, `CONFERENCE`, `WORKSHOP`
    string eventType?;
    # The start date and time of the marketing event.
    string startDateTime?;
    # The end date and time of the marketing event.
    string endDateTime?;
    # The name of the organizer of the marketing event.
    string eventOrganizer;
    # The description of the marketing event.
    string eventDescription?;
    # A URL in the external event application where the marketing event can be managed.
    string eventUrl?;
    # Indicates if the marketing event has been cancelled.  Defaults to `false`
    boolean eventCancelled?;
    # A list of PropertyValues. These can be whatever kind of property names and values you want. However, they must already exist on the HubSpot account's definition of the MarketingEvent Object. If they don't they will be filtered out and not set.
    # In order to do this you'll need to create a new PropertyGroup on the HubSpot account's MarketingEvent object for your specific app and create the Custom Property you want to track on that HubSpot account. Do not create any new default properties on the MarketingEvent object as that will apply to all HubSpot accounts.
    PropertyValue[] customProperties;
    # The accountId that is associated with this marketing event in the external event application.
    string externalAccountId;
    # The id of the marketing event in the external event application.
    string externalEventId;
};

# Batch marketing event info
public type MarketingEventCollectionResponse record {
    # Status of the event
    string status;
    # Marketing event info
    PublicMarketingEventResponse[] results;
    # Error count
    int numErrors?;
    # Errors
    StandardError[] errors?;
    # Requested at
    string requestedAt?;
    # Started at
    string startedAt;
    # Completed at
    string completedAt;
    # Links
    record {} links?;
};

public type MarketingEventSearchResponse record {
    MarketingEventExternalUniqueIdentifier[] results;
};

# Marketing event
public type MarketingEventDefaultResponse record {
    # The name of the marketing event.
    string eventName;
    # The type of the marketing event.
    string eventType?;
    # The start date and time of the marketing event.
    string startDateTime?;
    # The end date and time of the marketing event.
    string endDateTime?;
    # The name of the organizer of the marketing event.
    string eventOrganizer;
    # The description of the marketing event.
    string eventDescription?;
    # The URL in the external event application where the marketing event can be managed.
    string eventUrl?;
    # Indicates if the marketing event has been cancelled.
    boolean eventCancelled?;
    # A list of PropertyValues. These can be whatever kind of property names and values you want. However, they must already exist on the HubSpot account's definition of the MarketingEvent Object. If they don't they will be filtered out and not set.
    # In order to do this you'll need to create a new PropertyGroup on the HubSpot account's MarketingEvent object for your specific app and create the Custom Property you want to track on that HubSpot account. Do not create any new default properties on the MarketingEvent object as that will apply to all HubSpot accounts.
    PropertyValue[] customProperties;
};

# List of marketing event details to create or update
public type MarketingEventEmailSubscriberBatch record {
    # List of marketing event details to create or update
    MarketingEventEmailSubscriber[] inputs;
};

# External unique identifier of marketing event
public type MarketingEventExternalUniqueIdentifier record {
    # The id of the application that created the marketing event in HubSpot.
    int appId;
    # The accountId that is associated with this marketing event in the external event application.
    string externalAccountId;
    # The id of the marketing event in the external event application.
    string externalEventId;
};

# List of HubSpot contacts to subscribe to the marketing event
public type MarketingEventSubscriberBatch record {
    # List of HubSpot contacts to subscribe to the marketing event
    MarketingEventSubscriber[] inputs;
};
