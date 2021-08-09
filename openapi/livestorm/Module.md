## Overview

This is a generated connector for [Livestorm API v1](https://developers.livestorm.co/docs) OpenAPI specification. 

Livestorm is a browser based online web conferencing software used to share real-time live streams. It can be used to power remote live meetings, product demos, sales webinars, online lessons, onboarding sessions, more.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Livestorm Account](https://app.livestorm.co/#/signup)
* Obtaining tokens
    1. Log into [Livestorm Account](https://app.livestorm.co/#/login)
    2. Click the `Account settings`
    3. Navigate to `Integration` and choose `Public API`
    4. Click `Generate a token` to create a token      

## Quickstart

### Step 1: Import connector
Import the ballerinax/livestorm module into the Ballerina project.

```ballerina
import ballerinax/livestorm;
```
### Step 2: Create a new connector instance
```ballerina
livestorm:ApiKeysConfig config = {
    apiKeys : {
        Authorization : "<your apiKey>"
    }
};

livestorm:Client myclient = check new livestorm:Client(config, {}, "https://api.livestorm.co/v1");
```
### Step 3: Invoke connector operation
1. You can get list of events created with `listEvents` method.
    ```ballerina
    livestorm:InlineResponse200 result = check myclient->listEvents();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
