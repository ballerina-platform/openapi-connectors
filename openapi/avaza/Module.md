## Overview

The Avaza API v1 connector(https://api.avaza.com/swagger/ui/index) OpenAPI specification.
Avaza API allows to collaborate on projects, chat, schedule resources, track time, manage expenses & invoice customers.

### Key Features

- Programmatic access to create and manage resources via REST API
- Handle payments, billing, and financial transactions
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Avaza Account](https://signup.avaza.com/account/signup)
* Obtaining tokens
   1. Log into [Avaza Account](https://any.avaza.com/account/login)
   2. After login token can be obtained by navigating to `Settings`->`Manage Developer Apps`->`Developer Apps`. 

## Quickstart

To use the Avaza connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/avaza module into the Ballerina project.
```ballerina
import ballerinax/avaza;
```
### Step 2: Create a new connector instance
Add the project configuration file by creating a `Config.toml` file. Config file should have following configurations. Add the tokens obtained in the previous step to the `Config.toml` file.

```ballerina
[auth]
token = "<Bearer_token">
```
```ballerina
configurable http:BearerTokenConfig & readonly auth = ?;
avaza:ClientConfig clientConfig = {auth : auth};

avaza:Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.avaza.com/");
```
### Step 3: Invoke connector operation
1. You can get playlist created in your avaza account.
    ```ballerina
    avaza:CompanyList contactGet = check baseClient->companyGet();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
