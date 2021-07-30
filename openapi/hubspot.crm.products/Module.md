## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot CRM Products connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.product module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.product;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
product:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

product:Client baseClient = check new Client(clientConfig);

```
### Step 3 - Invoke connector operation

1. Create a product instance

```ballerina
product:SimplePublicObjectInput product = {
    properties : {
        "description": "Onboarding service for data product",
        "hs_cost_of_goods_sold": "600.00",
        "hs_recurring_billing_period": "P12M",
        "hs_sku": "191902",
        "name": "Implementation Service ",
        "price": "6000.00"
    }      
};

product:SimplePublicObject|error bEvent = baseClient->create(product);

if (bEvent is product:SimplePublicObject) {
    log:printInfo("Created the product" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```
2. List product instances

```ballerina
product:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is product:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Product list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

3. Use `bal run` command to compile and run the Ballerina program
