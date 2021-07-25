## Overview

The Interzoid Currency Rate connector module allows you to retrieves the latest currency exchange rate, provided in US dollars, for the given three-letter international currency code. These currency rates are compiled from many global sources and are updated several times per day.

This module supports only one operation found in Interzoid Get Currency Rate API.

## Configuring connector
### Prerequisites
* Private License Key for Interzoid Get Currency Rate API.

### Obtaining tokens

Follow the steps below to obtain the license key.
1. Go to [Interzoid](https://www.interzoid.com/register) page and sign up for Interzoid Get Currency Rate API. You can create a free account for testing purpose.

2. Once you sign up you will be asked for an email verification.

3. Once you have done with email verification you can go to [Interzoid register page] (https://www.interzoid.com/account) page and you can find your license key there.
 
## Quickstart

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