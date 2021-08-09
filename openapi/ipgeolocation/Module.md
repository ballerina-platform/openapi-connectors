## Overview

This is a generated connector for [Abstract IP geolocation API version 1](https://www.abstractapi.com/ip-geolocation-api#docs) OpenAPI Specification.

Abstract IP geolocation API allows developers to retrieve the region, country and city behind any IP worldwide. The API covers the geolocation of IPv4 and IPv6 addresses in 180+ countries worldwide. Extra information can be retrieved like the currency, flag or language associated to an IP. 

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

1. Create an [Abstract API](https://www.abstractapi.com/ip-geolocation-api#docs) account for IP Geolocation API. (If you already have one, you can use that.)

2. Obtain tokens - Follow [this guide](https://app.abstractapi.com/api/ip-geolocation/documentation) to find your private API key.

 
## Quickstart
To use the `IP Geolocation` connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/ipgeolocation module into the Ballerina project.

```ballerina
import ballerinax/ipgeolocation;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using API key and initialize the connector with it.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure API key in ballerina file directly. 

    ```ballerina
    ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            "api_key":"<YOUR API KEY HERE>"
        }
    };

    ipgeolocation:Client ipGeolocationClient = check new Client(apiKeyConfig);
    ```

- Option 2 :
    Configure API key in `Config.toml` file and configure it in ballerina file, using configurables. 

    1. Set up API key in `Config.toml` as shown below.
    ```
    [apiKeyConfig.apiKeys]
    api_key = "<YOUR API KEY HERE>"
    ```

    2. Configure the client in ballerina file as shown below.
    ```ballerina
    configurable ApiKeysConfig & readonly apiKeyConfig = ?;

    ipgeolocation:Client ipGeolocationClient = check new Client(apiKeyConfig);
    ```
    > Note: When you configure the API key value in the `Config.toml` file, use `api_key` as name and give the value of API key. (Eg: api_key = "YOUR API KEY")   

### Step 3: Invoke  connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.
Following is an example on how to get geolocation using the connector.

    ```ballerina
    public function main() {
        string ipAddress = "<IP ADDRESS TO GET GEOLOCATION>"
        Geolocation|error geolocation = ipGeolocationClient->getGeolocation(ipAddress);
        // Your logic here
    }
    ```
2. Use `bal run` command to compile and run the Ballerina program.

> Note : Here `ipAddress` parameter is the IP address to geolocate. Both IPv4 and IPv6 addresses are supported. Note that if this parameter is left blank, the service will geolocate the IP address from which the request was made.
