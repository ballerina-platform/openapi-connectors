## Overview
Ballerina connector for Notion API provides access to Notion's pages, databases, and users. It builds interactive experiences for users within Notion.

This module supports [Notion API](https://www.notion.so/).

## Configuring Connector

### Prerequisites
- An [Notion](https://www.notion.so/) Account

### Obtaining tokens
1. Obtain your token by creating an integration. Go to settings->integration
* Follow [this link](https://developers.notion.com/docs/authorization) for more information
 
## Quickstart

* Retrieve User

Step 1: Import notion module
First, import the ballerinax/notion module and others into the Ballerina project.
```ballerina
import ballerinax/notion;
import ballerina/log;
```
Step 2: Initialize the client.
You can initialize the client as follows using ballerina configurable variables.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
notion:ClientConfig clientConfig = { 
    authConfig : authConfig
};
notion:Client baseClient = check new Client(clientConfig);
```
Step 3: Retrieve User Detail
Get user detail by providing user ID
```ballerina
public function main() {
    var response = baseClient->retrieveUser(<UserID>);
    if (response is error) {
        log:printError(response.toString());
    } else {
        log:printInfo(response.toString());
    }
}
``` 
## Snippets
* Retrieve database by ID
```ballerina
var response = baseClient->retrieveDatabase(<DatabaseID>);
    if (response is error) {
        log:printError(response.toString());
    } else {
        log:printInfo(response.toString());
    }
```