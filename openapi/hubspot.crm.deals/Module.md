## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot CRM Deals connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.deal module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.deal;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
deal:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

deal:Client baseClient = check new Client(clientConfig);

```
### Step 3 - Invoke connector operation
1. Create a deal instance

```ballerina
deal:SimplePublicObjectInput deal = {
    properties : {
        "amount": "1500.00",
        "closedate": "2019-12-07T16:50:06.678Z",
        "dealname": "Custom data integrations",
        "dealstage": "presentationscheduled",
        "pipeline": "default"
    }      
};

deal:SimplePublicObject|error bEvent = baseClient->create(deal);

if (bEvent is deal:SimplePublicObject) {
    log:printInfo("Created the deal" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

2. List deals

```ballerina
deal:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is deal:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Deal list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

4. Use `bal run` command to compile and run the Ballerina program
