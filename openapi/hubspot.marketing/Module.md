## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform.
Ballerina connector for HubSpot Analytics allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    -  Use [this](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) guide to obtain the API keys related to your account.

## Quickstart
To use the HubSpot Marketing connector in your Ballerina application, update the .bal file as follows:

#### Step 1: Import HubSpot Marketing module
First, import the ballerinax/hubspot.marketing module into the Ballerina project.
```ballerina
import ballerinax/hubspot.marketing;
```

#### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
marketing:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

marketing:Client baseClient = check new Client(clientConfig);

```
### Step 3: Create a marketing event
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

