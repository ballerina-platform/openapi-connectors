## Overview
This is a generated connector from [Sakari](https://sakari.io/) OpenAPI Specification. Ballerina connector for Sakari is connecting the Sakari SMS REST API via Ballerina language easily. It provides interfaces to easily perform the operations on resources in Sakari account.

This module supports Sakari REST API v1.0.1.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Sakari developer account](https://hub.sakari.io/)
- Obtain tokens - Login into https://hub.sakari.io and click on the "cog" in the top right corner. In the popup dialog at the bottom you should see your API credentials and account id. If these are not visible you will need to click on "Request Credentials"
 
## Quickstart
To use the Sakari connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/sakari module into the Ballerina project.
```ballerina
import ballerinax/sakari;
```
### Step 2: Create a new connector instance
You can now make the connection configuration using the obtained credentials.
```ballerina
sakari:ClientConfig configuration = {
    authConfig: {
        clientId: <>,
        clientSecret: <>,
        tokenUrl: "https://api.sakari.io/oauth2/token"   
    }
};

sakari:Client sakariClient = check new Client(configuration);

```
### Step 3: Invoke the operation
Following code demonstrates how to fetch all contacts using `ballerinax/sakari` connector. 
```ballerina
public function main() returns error? {
    string accountId = <ACCOUNT_ID>;
    sakari:ContactsResponse contactsResponse = check sakariClient->fetchAllContacts(accountId);
}
``` 

