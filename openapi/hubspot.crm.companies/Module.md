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
To use the HubSpot CRM Companies connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot CRM Company module
First, import the ballerinax/hubspot.crm.company module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.company;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
company:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

company:Client baseClient = check new Client(clientConfig);

```

### Step 3: Create a company instance

```ballerina
company:SimplePublicObjectInput company = {
    properties : {
        "city": "Cambridge",
        "domain": "biglytics.net",
        "industry": "Technology",
        "name": "Biglytics",
        "phone": "(877) 929-0687",
        "state": "Massachusetts"
    }      
};

company:SimplePublicObject|error bEvent = baseClient->create(company);

if (bEvent is company:SimplePublicObject) {
    log:printInfo("Created the company" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

### Step 4: List companies

```ballerina
company:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is company:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Company list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```