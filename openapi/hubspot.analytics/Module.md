## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

These APIs allow triggering instances of custom behavioral events.

## Prerequisites
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    -  Use [this](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) guide to obtain the API keys related to your account.

## Quickstart
To use the HubSpot Analytics connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.analytics module into the Ballerina project.
```ballerina
import ballerinax/hubspot.analytics;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
analytics:ApiKeysConfig config = {
    hapikey : "<your apiKey>"
};

analytics:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation

1. Send a Custom Behavioral event

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

2. Use `bal run` command to compile and run the Ballerina program
