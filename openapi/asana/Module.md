## Overview

Asana API connector consume the data exposed in https://app.asana.com/api/1.0. It is supporting the operations available in official API documentation.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Asana API Account](https://asana.com/create-account)
* Obtaining tokens
        
    Follow [this link](https://app.asana.com/0/developer-console) and obtain the access token.

* Configure the connector with obtained tokens

## Quickstart

To use the Asana connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Asana API module
First, import the ballerinax/asana module into the Ballerina project.
```ballerina
import ballerinax/asana;
```
### Step 2: Configure the connection credentials.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;

asana:ClientConfig clientConfig = {
    authConfig : authConfig
    };

asana:Client myclient = check new asana:Client(clientConfig, "https://app.asana.com/api/1.0");
```
### Step 3: Get tasks
```ballerina
asana:InlineResponse20018 result = check myclient->getTasks(completedSince="2021-07-16T01:25:40+05:30", project="1200611263773935");
```

## Quick reference
The following code snippets shows how the connector operations can be used in different scenarios after initializing the client.
* Get users
```ballerina
asana:InlineResponse20027 result = check myclient->getUsers();
```
* Get projects
```ballerina
asana:InlineResponse20010 result = check myclient->getProjects();
```
* Get tasks
```ballerina
asana:InlineResponse20018 result = check myclient->getTasks(completedSince="2021-07-16T01:25:40+05:30", project="1200611263773935");
```
