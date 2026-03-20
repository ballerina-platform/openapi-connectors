## Overview
The Interzoid Global Phone Number Information API v1.0.0 connector(https://interzoid.com/services/getglobalnumberinfo) OpenAPI specification.

This API provides geographic information for a global telephone number provided in the input parameter, including city and country information, primary languages spoken, and mobile device identification.

### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining tokens by following [this link](https://www.interzoid.com/account) and obtain the license key.

## Quickstart
To use the Interzoid global phone number connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/interzoid.globalnumberinfo module into the Ballerina project.

```ballerina
import ballerinax/interzoid.globalnumberinfo as globalnumberinfo;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    globalnumberinfo:ApiKeysConfig apiKeyConfig = {
        license:"<PRIVATE LICENSE KEY>"
    };
    globalnumberinfo:Client myClient = check new Client(apiKeyConfig);
    ```

- Option 2 :
    Configure license key in `Config.toml` file and configure it in ballerina file, using configurables. 

    1. Set up license key in `Config.toml` as shown below.
    ```
    [apiKeyConfig.apiKeys]
    license:"<PRIVATE LICENSE KEY>"
    ```

    2. Configure the client in ballerina file as shown below.
    ```ballerina
    configurable ApiKeysConfig & readonly apiKeyConfig = ?;
    globalnumberinfo:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Invoke connector operation
1. You can get invoke the connecter operation by providing a international number (with country code).
    ```ballerina
        globalnumberinfo:GlobalNumberInfo numberInfo = myClient->getglobalnumberinfo(internationalNumberWithCountryCode);
    ```
2. Use `bal run` command to compile and run the Ballerina program.