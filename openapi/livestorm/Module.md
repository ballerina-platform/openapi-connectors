## Overview

Livestorm connector consume the data exposed in https://api.livestorm.co/v1. It is supporting the following operations.

- listEvents
- createEvent
- getEventByID
- listSessionByEvent
- createEventSession
- listSessionPeople
- registerPeopleForSession

## Obtaining tokens

### Prerequisites

- Livestorm Account

### Obtaining tokens

To utilize Livestorm users have to obtain API key given by [Livestorm](https://app.livestorm.co/#/signup)

To obtain an API Key please follow these steps
    * Go to [Livestorm](https://app.livestorm.co/#/signup) and register a new account
    * Submit information in register form
    * After submitting needed information API Key can be obtained by navigating to Account settings->Integration->Public API->Generate a token

Then provide the obtained API Key in client configuration.

## Quickstart

#### Step 1: Import Livestorm module
First, import the ballerinax/livestorm module into the Ballerina project.

```ballerina
import ballerinax/livestorm;
```
#### Step 2: Configure the connection credentials.
```ballerina
livestorm:ApiKeysConfig config = {
    apiKeys : {
        Authorization : "<your apiKey>"
    }
};

livestorm:Client myclient = check new livestorm:Client(config, {}, "https://api.livestorm.co/v1");
```
#### Step 3: List events
```ballerina
livestorm:ListEventsResponse result = check myclient->listEvents();
```

## Snippets
Snippets of some operations.

### Get event by ID
```ballerina
livestorm:GetEventByIDResponse result = check myclient->getEventByID(<Event_ID>);
```
### List events
```ballerina
livestorm:ListEventsResponse result = check myclient->listEvents();
```
### Create event
```ballerina
json request = {
    data: {
        'type: "events",
        attributes: {
            copy_from_event_id: "86cabff4-1c77-4717-82c3-de275b3edd1f",
            owner_id: "0a9dbf77-1c7a-489f-8f0a-4217bfce0312",
            title: "New event test",
            slug: "new-slug"
        },
        relationships: {
            sessions: [
                {
                    'type: "sessions",
                    attributes: {
                        estimated_started_at: "2021-11-28 11:30:00",
                        timezone: "Europe/Paris"
                    }
                }
            ]
        }
    }
};
CreateEventRequest createRequest = check request.cloneWithType(CreateEventRequest);

livestorm:CreateEventResponse result = check myclient->createEvent(createRequest);
```
