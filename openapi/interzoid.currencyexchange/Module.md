## Overview

The Interzoid Currency Rate connector module allows you to retrieves the latest currency exchange rate, provided in US dollars, for the given three-letter international currency code. These currency rates are compiled from many global sources and are updated several times per day.

This module supports only one operation found in Interzoid Get Currency Rate API.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining tokens
        
    Follow [this link](https://www.interzoid.com/account) and obtain the license key.

* Configure the connector with obtained license key

## Quickstart

To use the Interzoid currency exchange connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import Interzoid currency exchange rate module
First, import the ballerinax/interzoid.currencyexchange module into the Ballerina project.

```ballerina
import ballerinax/interzoid.currencyexchange as currencyexchange;
```

### Step 2: Configure the API key.
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    currencyexchange:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            license:"<PRIVATE LICENSE KEY>"
        }
    };

    currencyexchange:Client myClient = check new Client(apiKeyConfig);
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

    currencyexchange:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Get latest currency exchange rate against the US dollar

```ballerina
    currencyexchange:ExchangeRate currencyrate = myClient->getCurrencyRate("LKR");
```