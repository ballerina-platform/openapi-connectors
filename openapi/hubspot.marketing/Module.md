## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

These APIs allow you to interact with HubSpot's Marketing Events Extension.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    -  Use [this](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) guide to obtain the API keys related to your account.

## Quickstart
To use the HubSpot Marketing connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
First, import the ballerinax/hubspot.marketing module into the Ballerina project.
```ballerina
import ballerinax/hubspot.marketing;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
marketing:ApiKeysConfig config = {
    hapikey : "<your apiKey>"
};

marketing:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation

1. Create a marketing event
```ballerina
marketing:MarketingEventCreateRequestParams event = {
    eventName: "<EVENT_NAME>",
    eventOrganizer: "<EVENT_ORGANIZER>",
    customProperties: [],
    externalAccountId: "<EXTERNAL_ACCOUNT_ID>",
    externalEventId: "<EXTERNAL_EVENT_ID>"
};

marketing:MarketingEventDefaultResponse|error bEvent = baseClient->createMarketingEvent(event);

if (bEvent is marketing:MarketingEventDefaultResponse) {
    log:printInfo("Created behavoural event");
} else {
    log:printInfo(msg = bEvent.message());
}
```

2. Use `bal run` command to compile and run the Ballerina program
