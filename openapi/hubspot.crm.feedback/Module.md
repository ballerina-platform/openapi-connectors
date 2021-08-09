## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    -  Use [this](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) guide to obtain the API keys related to your account.

## Quickstart
To use the HubSpot CRM Feedback connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.feedback module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.feedback;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
feedback:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

feedback:Client baseClient = check new Client(clientConfig);

```
### Step 3 - Invoke connector operation
1. List feedbacks

```ballerina
feedback:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is feedback:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Feedback list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

2. Use `bal run` command to compile and run the Ballerina program
