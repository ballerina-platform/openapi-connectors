
## Overview

The Open Weather Map connector consume the data exposed in [openweathermap.org](https://openweathermap.org/). It is currently supporting the following operations.

### Get Current Weather Data

Can be used to access current weather data for any location on Earth including over 200,000 cities.

For more details please check [here](https://openweathermap.org/current)

### Get Weather Forecast

Can be used to access current weather, minute forecast for 1 hour, hourly forecast for 48 hours, daily forecast for 7 days and government weather alerts.

For more details please check [here](https://openweathermap.org/api/one-call-api)

This module supports OpenWeatherMap API version 2.5.

## Configuring connector

### Prerequisites

[OpenWeatherMap](https://openweathermap.org/) account.

### Obtaining tokens

To access the Open Weather API users need to have an API key given by [openweathermap.org](https://openweathermap.org/)  

To obtain an API Key please follow these steps  
* Go to openweathermap.org and create an account
    - You can choose a subscription matching with your requirements
* Go to [My API Keys](https://home.openweathermap.org/api_keys) and generate a new API Key

## Quickstart

### Step 1: Import openweathermap module
First, import the ballerinax/zoom module into the Ballerina project.

```ballerina
    import ballerinax/openweathermap;
```

### Step 2: Configure the connection credentials. 

Then provide the obtained API Key in client configuration.

```ballerina
    ApiKeysConfig config = {
        apiKeys : {
            appid : "<your appid>"
        }
    }

    openweathermap:Client openweatherClient = check new openweathermap:Client(config);

};
```

### Step 3: Get current weather data. 

Obtain current weather data by city name using `ballerinax/openweathermap` connector 

```ballerina
    CurrentWeatherData result = check weatherclient->getCurretWeatherData("Colombo");
    log:printInfo("Colombo Current Weather data : " + result.toString());

```

## Snippets

* Get Weather Forecast

    ```ballerina
    CurrentWeatherData result = check weatherclient->getWeatherForecast(lat = "6.93194", lon = "79.847778");
    log:printInfo("Colombo Weather Forecast : " + result.toString());
    ```
    
* Get current weather data by city id

    Calling the API by city ID (using the `id` parameter) will provide the most precise location results.

    ```ballerina
    weather:CurrentWeatherData curretWeatherData = check weatherclient->getCurretWeatherData(id = "2172797");
    ```