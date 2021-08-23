## Overview

This is a generated connector for [Notion API v1](https://developers.notion.com/reference/intro) OpenAPI Specification. 

Notion API provide capability to access all-in-one workspace where you can write, plan, collaborate and get organized.
it has components such as notes, databases, kanban boards, wikis, calendars, and reminders. You can connect these 
components to take notes, add tasks, manage projects & more. Notion provides the building blocks and you can 
create your own layouts and toolkit to get work done. This ballerina connector allows you to connect Notion through its
[REST API](https://developers.notion.com/docs).

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [Notion](https://www.notion.so/) Account
* Obtaining tokens
1. Obtain your token by creating an integration. Go to settings->integration. Follow [this link](https://developers.notion.com/docs/authorization) for more information
 
## Quickstart

To use the notion connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
First, import the ballerinax/notion module and others into the Ballerina project.
```ballerina
import ballerinax/notion;
```
### Step 2 - Create a new connector instance
You can initialize the client as follows using ballerina configurable variables.
```ballerina
configurable http:BearerTokenConfig & readonly auth = ?;
notion:ClientConfig clientConfig = { 
    auth : auth
};
notion:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke  connector operation
1. Invoke connector operations using the client
Get user detail by providing user ID
```ballerina
public function main() returns error? {
    notion:User response = check baseClient->retrieveUser(<UserID>);
}
``` 
2. Use `bal run` command to compile and run the Ballerina program.
