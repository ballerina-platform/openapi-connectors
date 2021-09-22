## Overview

The `IP Geolocation` connector module allows you to look up the location, timezone, country details, and more of an IPv4 or IPv6 address. 

This module supports [IP Geolocation API](https://www.abstractapi.com/ip-geolocation-api) version 1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

- Create an [Abstract API](https://www.abstractapi.com/ip-geolocation-api#docs) account for IP Geolocation API. (If you already have one, you can use that.)

- Obtaining tokens - Follow [this link](https://app.abstractapi.com/api/ip-geolocation/documentation) to find your private API key.

- Configure the connector with obtained tokens

> Note: When you configure the API key value in the `Config.toml` file, use `api_key` as name and give the value of API key. (Eg: api_key = "YOUR API KEY")   
 
## Quickstart

### Step 1: Import IP Geolocation module
First, import the ballerinax/ipgeolocation module into the Ballerina project.

```ballerina
import ballerinax/ipgeolocation;
```

### Step 2: Configure the API key.
You can now make the connection configuration using API key.

    ```ballerina
    ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            "api_key":"<YOUR API KEY HERE>"
        }
    };
    
    ipgeolocation:Client ipGeolocationClient = check new Client(apiKeyConfig);
    ```

### Step 3: Get geolocation

```ballerina
public function main() {
    string ipAddress = "<IP ADDRESS TO GET GEOLOCATION>"
    Geolocation|error geolocation = ipGeolocationClient->getGeolocation(ipAddress);
    // Your logic here
}
```
> Note : Here `ipAddress` parameter is the IP address to geolocate. Both IPv4 and IPv6 addresses are supported. Note that if this parameter is left blank, the service will geolocate the IP address from which the request was made.
