## Overview

Livestorm connector consume the data exposed in https://api.livestorm.co/v1. It is supporting the operations such as listEvents, createEvent, getEventByID, listSessionByEvent, createEventSession, listSessionPeople and registerPeopleForSession.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Livestorm Account](https://app.livestorm.co/#/signup)
* Obtaining tokens
        
    Follow [this link](https://app.livestorm.co/#/login) and obtain tokens by navigating to `Account settings`->`Integration`->`Public API`->`Generate a token`.

## Quickstart

### Step 1: Import connector
First, import the ballerinax/livestorm module into the Ballerina project.

```ballerina
import ballerinax/livestorm;
```
### Step 2: Create a new connector instance
```ballerina
livestorm:ApiKeysConfig config = {
    apiKeys : {
        Authorization : "<your apiKey>"
    }
};

livestorm:Client myclient = check new livestorm:Client(config, {}, "https://api.livestorm.co/v1");
```
### Step 3: Invoke connector operation
1. You can get list of events created with `listEvents` method.
    ```ballerina
    livestorm:ListEventsResponse result = check myclient->listEvents();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 

## Quick reference

* Get event by ID
    ```ballerina
    livestorm:GetEventByIDResponse result = check myclient->getEventByID(<Event_ID>);
    ```
* List events
    ```ballerina
    livestorm:ListEventsResponse result = check myclient->listEvents();
    ```
* Create event
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
