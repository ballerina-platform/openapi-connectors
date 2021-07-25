## Overview

The Interzoid Convert Currency connector module allows you to convert an amount of one currency into another currency using current foreign exchange rates.

This module supports only one operation found in Interzoid Convert Currency API.

## Configuring connector
### Prerequisites
* Private License Key for Interzoid Convert Currency API.

### Obtaining tokens

Follow the steps below to obtain the license key.
1. Go to [Interzoid](https://www.interzoid.com/register) page and sign up for Interzoid Convert Currency API. You can create a free account for testing purpose.

2. Once you sign up you will be asked for an email verification.

3. Once you have done with email verification you can go to [Interzoid register page] (https://www.interzoid.com/account) page and you can find your license key there.
 
## Quickstart

### Step 1: Import Interzoid convert currency module
First, import the ballerinax/interzoid.convertcurrency module into the Ballerina project.

```ballerina
import ballerinax/interzoid.convertcurrency as convertcurrency;
```

### Step 2: Configure the API key.
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    convertcurrency:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            license:"<PRIVATE LICENSE KEY>"
        }
    };

    convertcurrency:Client myClient = check new Client(apiKeyConfig);
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

    convertcurrency:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Convert an amount of one currency into another currency

```ballerina
    convertcurrency:CurrencyConversionInfo convertedCurrency = myClient->convertCurrency("USD", "LKR", "10");
```