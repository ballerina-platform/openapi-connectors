## Overview

Asana API connector consume the data exposed in https://app.asana.com/api/1.0. It is supporting the operations available in official API documentation.

## Configuring Connector

### Prerequisites

- Asana API Account

### Obtaining tokens

To utilize Asana API users have to obtain token given by [Asana API](https://asana.com/create-account)

To obtain an token please follow these steps
    * Go to [Asana API](https://asana.com/create-account) and register a new account
    * Submit information in register form
    * After submitting needed information token can be obtained from [Developer app console](https://app.asana.com/0/developer-console) by creating an app and get an access token. 

Then provide the obtained token in client configuration.

## Quickstart

#### Step 1: Import Asana API module
First, import the ballerinax/asana module into the Ballerina project.
```ballerina
import ballerinax/asana;
```
#### Step 2: Configure the connection credentials.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;

asana:ClientConfig clientConfig = {
    authConfig : authConfig
    };

asana:Client myclient = check new asana:Client(clientConfig, "https://app.asana.com/api/1.0");
```
#### Step 3: Get tasks
```ballerina
asana:InlineResponse20018 result = check myclient->getTasks(completedSince="2021-07-16T01:25:40+05:30", project="1200611263773935");
```

## Snippets
Snippets of some operations.

### Get users
```ballerina
asana:InlineResponse20027 result = check myclient->getUsers();
```
### Get projects
```ballerina
asana:InlineResponse20010 result = check myclient->getProjects();
```
### Get tasks
```ballerina
asana:InlineResponse20018 result = check myclient->getTasks(completedSince="2021-07-16T01:25:40+05:30", project="1200611263773935");
```
