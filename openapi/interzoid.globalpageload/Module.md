## Overview
This is a generated connector for [Interzoid Global Page Load Performance API](https://interzoid.com/services/globalpageload) OpenAPI specification.

This API provides a timed, browser-simulated page load function (or other Web function such as an API call) from the specified geography using a server from that geography. A round-trip performance measurement is returned from the location specified in the input parameter.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining tokens by following [this link](https://www.interzoid.com/account) and obtain the license key.

## Quickstart
To use the Interzoid global page load preformance connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/interzoid.globalpageload module into the Ballerina project.

```ballerina
import ballerinax/interzoid.globalpageload as globalpageload;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    globalpageload:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            license:"<PRIVATE LICENSE KEY>"
        }
    };
    globalpageload:Client myClient = check new Client(apiKeyConfig);
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
    globalpageload:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Invoke connector operation
1. You can get invoke the connecter operation by providing a origin & a url as inputs.
    ```ballerina
        globalpageload:PageLoadPerformance pageLoadPerformance = myClient->getGlobalPageLoad("Singapore", "http://www.ebay.com");
    ```
2. Use `bal run` command to compile and run the Ballerina program.