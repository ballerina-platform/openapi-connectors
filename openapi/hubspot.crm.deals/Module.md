## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 

Ballerina connector for HubSpot CRM allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>
* Configure the connector with obtained tokens

## Quickstart
To use the HubSpot CRM Deals connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot CRM Deal module
First, import the ballerinax/hubspot.crm.deal module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.deal;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
deal:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

deal:Client baseClient = check new Client(clientConfig);

```

### Step 3: Create a deal instance

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

### Step 4: List deals

```ballerina
deal:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is deal:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Deal list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```