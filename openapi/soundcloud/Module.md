## Overview
Ballerina connector for soundcloud is connecting the soundcloud [REST API](https://developers.soundcloud.com/docs/api/explorer/open-api) via Ballerina language easily.  SoundCloud has stopped accepting new apps a while ago. You may not be able to register one. If you are a registered SoundCloud user, you may be able to use the REST API.

This module supports REST API version 1.0.0 for soundcloud.
 
## Configuring Connector

### Prerequisites
- An soundcloud account

### Obtaining tokens

1. Follow this [link](https://developers.soundcloud.com/docs/api/guide) to obtain tokens

 
## Quickstart

* Get User Detail

Step 1: Import soundcloud module
First, import the ballerinax/soundcloud module into the Ballerina project.
```ballerina
import ballerinax/soundcloud;
```
Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token
```ballerina
configurable string & readonly token = ?;
soundcloud:ApiKeysConfig apiKeyConfig = {
    apiKeys: {"Authorization": token}
};

soundcloud:Client baseClient = check new Client(apiKeyConfig);
```
Step 3: Get user by ID

```ballerina
public function main() {
    var response = baseClient->getUserByID(<userID>);
    if (response is error) {
        log:printError(response.toString());
    } else { 
        log:printInfo(response.toString());
    }
}
``` 