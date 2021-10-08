## Overview
This is a generated connector for [Interzoid State Data API v1.0.0](https://www.interzoid.com/services/getstateabbreviation) OpenAPI specification.

This API provides the two-letter state abbreviation (or the province abbreviation for Canada) for state names, including many variations of a given state name.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining tokens by following [this link](https://www.interzoid.com/account) and obtain the license key.

## Quickstart
To use the Interzoid state data connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/interzoid.statedata module into the Ballerina project.

```ballerina
import ballerinax/interzoid.statedata as statedata;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    statedata:ApiKeysConfig apiKeyConfig = {
        license:"<PRIVATE LICENSE KEY>"
    };

    statedata:Client myClient = check new Client(apiKeyConfig);
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

    statedata:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Invoke connector operation
1. You can get get two-letter state abbreviation for a particular state.
    ```ballerina
        statedata:StateData stateData = myClient->getstateabbreviation("Ohio");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 