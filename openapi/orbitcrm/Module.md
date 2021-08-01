## Overview

This is a generated connector for [Orbit API v1](https://docs.orbit.love/reference/about-the-orbit-api) OpenAPI specification. 

Orbit API used to track activities of users and manage users.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:
* Create [Orbit Account](https://app.orbit.love/signup)
* Obtaining tokens
    1. Log into [Orbit Account](https://app.orbit.love/login) and get token by navigating to `Account Settings`

## Quickstart

### Step 1: Import connector
First, import the ballerinax/orbitcrm module into the Ballerina project.

```ballerina
import ballerinax/orbitcrm;
```
### Step 2: Create a new connector instance

Add the project configuration file by creating a `Config.toml` file. Config file should have following configurations. Add the tokens obtained in the previous step to the `Config.toml` file.

```ballerina
[authConfig]
token = "<Bearer_token">
```

```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
orbitcrm:ClientConfig clientConfig = {authConfig : authConfig};

orbitcrm:Client myclient = check new orbitcrm:Client(clientConfig, {}, "https://app.orbit.love/api/v1");
```
### Step 3: Invoke connector operation
1. You can get activity details as follows with `getActivitiesById` method by passing Id of a work sheet as a parameter. Successful creation returns the `json` containing activity detail and the error cases returns an `error` object.
    ```ballerina
    orbitcrm:json result = check myclient->getActivitiesById(<Workspace_ID>);
    ```
2. Use `bal run` command to compile and run the Ballerina program. 

## Quick reference

* Get list of activities
    ```ballerina
    orbitcrm:json result = check baseClient->getActivitiesInWorkspace(<Workspace_ID>);
    ```
* Get available workspaces
    ```ballerina
    orbitcrm:json result = check myclient->getWorkspaces();
    ```
* Get activity detail
    ```ballerina
    orbitcrm:json result = check myclient->getActivitiesById(<Workspace_ID>,<Activity_ID>);
    ```
