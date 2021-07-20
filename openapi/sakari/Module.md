## Overview
Ballerina connector for Sakari is connecting the Sakari SMS REST API via Ballerina language easily. It provides interfaces to easily perform the operations on resources in Sakari account.

This module supports REST API v1.0.1 for Sakari.
 
## Configuring connector
### Prerequisites
- A Sakari Developer Account

### Obtaining tokens
To authenticate against the API's you will need three key pieces of data
1. Client ID
2. Client Secret
3. Account ID
- To retrieve these, simply login into https://hub.sakari.io and click on the "cog" in the top right corner. In the popup dialog at the bottom you should see your API credentials and account id. If these are not visible you will need to click on "Request Credentials"

**Note:** Tokens should be kept secret
 
## Quickstart
### Fetch contacts
#### Step 1: Import Sakari module
First, import the ballerinax/sakari module into the Ballerina project.
```ballerina
import ballerinax/sakari;
```
#### Step 2: Configure the connection credentials.
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
#### Step 3: Invoke the operation

```ballerina
public function main() returns error? {
    string accountId = <ACCOUNT_ID>;
    sakari:ContactsResponse contactsResponse = check sakariClient->contactsFetchall(accountId);
}
``` 

