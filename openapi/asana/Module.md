## Overview

This is a generated connector for [Asana API v1.0](https://developers.asana.com/docs) OpenAPI specification.

This API enables you to help teams organize, track and manage their work. For additional help getting started with the API, visit [Asana API](https://developers.asana.com).

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Asana Account](https://asana.com/create-account)
* Obtaining tokens
   1. Log into [Asana Account](https://app.asana.com/-/login)
   2. Token can be obtained from [Developer app console](https://app.asana.com/0/developer-console) by creating an app and get an access token. 

## Quickstart

To use the Asana connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/asana module into the Ballerina project.
```ballerina
import ballerinax/asana;
```
### Step 2: Create a new connector instance
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;

asana:ClientConfig clientConfig = {
    authConfig : authConfig
    };

asana:Client myclient = check new asana:Client(clientConfig, "https://app.asana.com/api/1.0");
```
### Step 3: Invoke connector operation
1. You can get tasks related to a specific project.
    ```ballerina
    asana:InlineResponse20018 result = check myclient->getTasks(completedSince="2021-07-16T01:25:40+05:30", project="1200611263773935");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 

