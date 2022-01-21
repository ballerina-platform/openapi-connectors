## Overview

This is a generated connector from [Open Weather Map API v2.5](https://openweathermap.org/) OpenAPI Specification. 

The Open Weather Map API provides access to current weather data and weather forecast of any location worldwide including 200,000 cities by consuming the [`Current Weather Data`](https://openweathermap.org/current) and [`One Call`](https://openweathermap.org/api/one-call-api) API endpoints.  

## Prerequisites

* Create [OpenWeatherMap](https://openweathermap.org/) account.
    - Choose a subscription that matches with your requirements
* Obtain Api Key
    - Visit [My API Keys](https://home.openweathermap.org/api_keys) and generate a new API Key

## Quickstart

To use the Open Weather Map connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector

```ballerina
    import ballerinax/openweathermap;
```

### Step 2: Create a new connector instance

Provide the obtained API Key in client configuration.

```ballerina
    openweathermap:ApiKeysConfig config = {
        appid : "<your appid>"
    };

    openweathermap:Client openweatherClient = check new Client(config);
```

### Step 3: Invoke  connector operation

1. Obtain current weather data by city name.

```ballerina
    openweathermap:CurrentWeatherData result = check openweatherClient->getCurretWeatherData("Colombo");
    log:printInfo("Colombo Current Weather data : " + result.toString());

```
2. Use `bal run` command to compile and run the Ballerina program.
