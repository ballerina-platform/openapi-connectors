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
To use the HubSpot CRM Imports connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot CRM Import module
First, import the ballerinax/hubspot.crm.import module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.import;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
import:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

import:Client baseClient = check new Client(clientConfig);

```
### Step 3: List imports

```ballerina
import:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is import:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Imports list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```