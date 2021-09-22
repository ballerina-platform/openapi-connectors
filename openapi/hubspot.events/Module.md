## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 

Ballerina connector for HubSpot Events allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot Events connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot Events module
First, import the ballerinax/hubspot.event module into the Ballerina project.
```ballerina
import ballerinax/hubspot.event;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
event:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

event:Client baseClient = check new Client(clientConfig);

```

### Step 3: List Events

```
event:CollectionResponseExternalUnifiedEvent|error eventList = baseClient->listEvents("contact",<OBJECT_ID>);
if (eventList is event:CollectionResponseExternalUnifiedEvent) {
    log:printInfo("Event List " + eventList.toString());
} else {
    log:printInfo(msg = eventList.message());
}
```