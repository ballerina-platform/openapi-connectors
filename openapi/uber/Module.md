## Overview
Ballerina connector for Uber, connects the Uber [REST API](https://developer.uber.com/docs/riders/references/api) via Ballerina language easily.  Uber has stopped accepting [new apps](https://developer.uber.com/docs/riders/guides/scopes) a while ago. You may not be able to register a new app. If you are a registered Uber user, you may be able to use the REST API.

This module supports REST API version v1.2 of Uber.
 
## Configuring Connector

### Prerequisites
- An Uber Account

### Obtaining tokens

1. Please follow this [link](https://developer.uber.com/docs/riders/references/api) to obtain tokens

 
## Quickstart

* Get User Detail

Step 1: Import Uber module
First, import the ballerinax/uber module into the Ballerina project and the log module.
```ballerina
import ballerinax/uber;
import ballerinax/log;
```
Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
uber:ClientConfig clientConfig = {
    authConfig : authConfig
};
uber:Client baseClient = check new Client(apiKeyConfig);
```
Step 3: Get user detail
```ballerina
public function main() {
    var response = baseClient->getUser();
    if (response is error) {
        log:printError(response.toString());
    } else { 
        log:printInfo(response.toString());
    }
}
``` 