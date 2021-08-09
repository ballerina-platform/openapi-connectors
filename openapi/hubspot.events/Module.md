## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

These APIs allow accessing CRM object events.

## Prerequisites
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot Events connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.event module into the Ballerina project.
```ballerina
import ballerinax/hubspot.event;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
event:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

event:Client baseClient = check new Client(clientConfig);
```

### Step 3 - Invoke connector operation

1. List Events

```
event:CollectionResponseExternalUnifiedEvent|error eventList = baseClient->listEvents("contact",<OBJECT_ID>);
if (eventList is event:CollectionResponseExternalUnifiedEvent) {
    log:printInfo("Event List " + eventList.toString());
} else {
    log:printInfo(msg = eventList.message());
}
```

5. Use `bal run` command to compile and run the Ballerina program
