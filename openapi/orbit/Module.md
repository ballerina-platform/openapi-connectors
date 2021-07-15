## Overview

Orbit connector consume the data exposed in https://orbit.org/v2. It is supporting all operations provided by Orbit API.

## Obtaining tokens

### Prerequisites

- Orbit Account

### Obtaining tokens

To utilize Orbit users have to obtain token given by [Orbit](https://app.orbit.love/)

To obtain an API token please follow these steps
    * Go to [Orbit](https://app.orbit.love/) and register a new account
    * Submit information in register form
    * After submitting needed information API token can be obtained by navigating to `Account Settings`

Then provide the obtained API token in client configuration.

## Quickstart

### Client configuration

#### Step 1: Import Orbit module
First, import the ballerinax/orbit module into the Ballerina project.

```ballerina
import ballerinax/orbit;
```
#### Step 2: Configure the connection credentials.

Add the project configuration file by creating a `Config.toml` file. Config file should have following configurations. Add the tokens obtained in the previous step to the `Config.toml` file.

```ballerina
[authConfig]
token = "<Bearer_token">
```

```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
orbit:ClientConfig clientConfig = {authConfig : authConfig};

orbit:Client myclient = check new orbit:Client(clientConfig, {}, "https://app.orbit.love/api/v1");
```
#### Step 3: Get activities
```ballerina
orbit:json result = check myclient->getActivitiesById(<Workspace_ID>);
```

## Snippets
Snippets of some operations.

### Get list of activities
```ballerina
orbit:json result = check baseClient->activities(<Workspace_ID>);
```
### Get available workspaces
```ballerina
orbit:json result = check myclient->workspaces();
```
### Get activity detail
```ballerina
orbit:json result = check myclient->getActivitiesById(<Workspace_ID>,<Activity_ID>);
```