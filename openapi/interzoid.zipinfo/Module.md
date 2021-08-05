## Overview

This is a generated connector for [Interzoid Zip Code Detailed Information API](https://www.interzoid.com/services/getzipcodeinfo) OpenAPI specification.

The Interzoid zip code detailed information connector module provides detailed information for a given zip code, including city, state, latitude, longitude, area size, and various population demographics. 
For additional help getting started with the API, visit [Interzoid Zip Code Detailed Information API](https://www.interzoid.com/services/getzipcodeinfo).

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining tokens- follow [this link](https://www.interzoid.com/account)

## Quickstart

To use the Interzoid zip code detailed information connector convert currency connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/interzoid.zipinfo module into the Ballerina project.

```ballerina
import ballerinax/interzoid.zipinfo;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    zipinfo:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            license:"<PRIVATE LICENSE KEY>"
        }
    };
    zipinfo:Client myClient = check new Client(apiKeyConfig);
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
    zipinfo:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Invoke connector operation 
1. You can get zip information using following operation.
    ```ballerina
    zipinfo:GetzipcodeinfoResponse zipInfo = myClient->getzipcodeinfo(license, zip);
    ```
2. Use `bal run` command to compile and run the Ballerina program. 