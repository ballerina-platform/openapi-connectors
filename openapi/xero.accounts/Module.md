## Overview

Xero Accounts connector consume the data exposed in https://api.xero.com/api.xro/2.0. It is supporting all operations provided by Xero Accounting API.

## Configuring Connector

### Prerequisites

- Xero Account

### Obtaining tokens

To utilize Xero users have to obtain token given by [Xero](https://developer.xero.com/documentation/guides/oauth2/auth-flow/#1-send-a-user-to-authorize-your-app)

## Quickstart

### Client configuration

#### Step 1: Import Xero Accounts module
First, import the ballerinax/xero.accounts module into the Ballerina project.

```ballerina
import ballerinax/xero.accounts as accounts;
```
#### Step 2: Configure the connection credentials.

Add the project configuration file by creating a `Config.toml` file. Config file should have following configurations. Add the tokens obtained in the previous step to the `Config.toml` file.

```ballerina
[authConfig]
token = "<Token">
```

```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
accounts:ClientConfig clientConfig = {authConfig : authConfig};

accounts:Client myclient = check new accounts:Client(clientConfig, "https://api.xero.com/api.xro/2.0");
```
#### Step 3: Get purchase orders
```ballerina
accounts:PurchaseOrders result = check myclient->getPurchaseOrders(<Tenant_ID>);
```
