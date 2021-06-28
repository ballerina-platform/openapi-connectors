import ballerina/test;
import ballerina/os;

configurable string & readonly apiKey = os:getEnv("API_KEY");

ApiKeysConfig config = {
    apiKeys : {
        appid : apiKey
    }
};

string cityName = "Colombo";
string cityId = "2172797";
string lat = "6.93194";
string lon = "79.847778";
string country = "LK";
string language = "en";
string zipCode = "94040";

Client myclient = check new Client(config);

@test:Config{}
function testGetWeatherByCountryName() {
    CurrentWeatherData|error result = myclient->getCurretWeatherData(cityName);
    if (result is CurrentWeatherData) {
        test:assertTrue(result.length() > 0, "Failed to get current weather data by city name");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testGetWeatherByLatLon() {
    CurrentWeatherData|error result = myclient->getCurretWeatherData(lat = lat, lon = lon);
    if (result is CurrentWeatherData) {
        test:assertTrue(result.length() > 0, "Failed to get current weather data by geo location");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testGetWeatherByCityId() {
    CurrentWeatherData|error result = myclient->getCurretWeatherData(id=cityId);
    if (result is CurrentWeatherData) {
        test:assertTrue(result.length() > 0, "Failed to get current weather data by city id");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testGetWeatherByZip() {
    CurrentWeatherData|error result = myclient->getCurretWeatherData(zip = zipCode);
    if (result is CurrentWeatherData) {
        test:assertTrue(result.length() > 0, "Failed to get current weather data by zip code");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testGetWeatherForecast() {
    WeatherForecast|error result = myclient->getWeatherForecast(lat = lat, lon = lon, exclude = "minutely, hourly", units = "standard", lang = "en");
    if (result is WeatherForecast) {
        test:assertTrue(result.length() > 0, "Failed to get the weather forecast");
    } else {
        test:assertFail(msg = result.message());
    }
}
