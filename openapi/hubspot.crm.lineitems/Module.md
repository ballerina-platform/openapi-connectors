## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 

Ballerina connector for HubSpot CRM allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot CRM Lineitems connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot CRM Lineitem module
First, import the ballerinax/hubspot.crm.lineitem module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.lineitem;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
lineitem:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

lineitem:Client baseClient = check new Client(clientConfig);

```
### Step 3: Create a lineitem instance

```ballerina
lineitem:SimplePublicObjectInput lineitem = {
    properties : {
        "name": "1 year implementation consultation",
        "hs_recurring_billing_period": "P24M",
        "recurringbillingfrequency": "monthly",
        "quantity": "2",
        "price": "6000.00"
    }      
};

lineitem:SimplePublicObject|error bEvent = baseClient->create(lineitem);

if (bEvent is lineitem:SimplePublicObject) {
    log:printInfo("Created the line-item" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```
### Step 4: List companies

```ballerina
lineitem:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is lineitem:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Line-item list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```