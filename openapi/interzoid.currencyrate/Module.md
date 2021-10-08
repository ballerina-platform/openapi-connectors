## Overview
This is a generated connector for [Interzoid Currency Rate API v1.0.0](https://interzoid.com/services/getcurrencyrate) OpenAPI specification.

This API retrieves the latest currency exchange rate, provided in US Dollars, for the given three-letter international currency code. These currency rates are compiled from many global sources and are updated several times per day.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining token by following [this link](https://www.interzoid.com/account) and obtain the license key.

## Quickstart
To use the Interzoid currency rate connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/interzoid.currencyrate module into the Ballerina project.

```ballerina
import ballerinax/interzoid.currencyrate as currencyrate;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    currencyrate:ApiKeysConfig apiKeyConfig = {
        license:"<PRIVATE LICENSE KEY>"
    };
    currencyrate:Client myClient = check new Client(apiKeyConfig);
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
    currencyrate:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Invoke connector operation
1. You can retrieve the latest currency exchange rate, provided in US Dollars, for the given three-letter international currency code using following function.
    ```ballerina
        currencyrate:CurrencyInfo currencyRate = myClient->getCurrencyRate("EUR");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 