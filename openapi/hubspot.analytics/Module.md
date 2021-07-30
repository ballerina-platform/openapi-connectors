## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 
Built-in marketing analytics (email analytics, traffic analytics, and website analytics) make it easy to understand 
which sales and marketing actions driving the most success.
Ballerina connector for HubSpot Analytics allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    -  Use [this](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) guide to obtain the API keys related to your account.

## Quickstart
To use the HubSpot Analytics connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot Analytics module
First, import the ballerinax/hubspot.analytics module into the Ballerina project.
```ballerina
import ballerinax/hubspot.analytics;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
analytics:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

analytics:Client baseClient = check new Client(clientConfig);

```
### Step 3: Send a Custom Behavioral event

```
analytics:BehaviouralEvent event = {
    eventName: "pe20436354_e_visited_page",
    properties: {
        
    },
    email: "string"
};

http:Response|error bEvent = baseClient->sendEvent(event);

if (bEvent is http:Response && bEvent.statusCode == 204) {
    log:printInfo("Created behavoural event");
} else if(bEvent is http:Response) {
    json payload = check bEvent.getTextPayload();
    log:printInfo(payload.toString());
} else {
    log:printInfo(msg = bEvent.message());
}
```