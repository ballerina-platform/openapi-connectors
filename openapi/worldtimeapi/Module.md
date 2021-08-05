## Overview
This is a generated connector for [WorldTimeAPI v0.6.1](http://worldtimeapi.org/) OpenAPI Specification.

[WorldTime API](http://worldtimeapi.org/pages/faqs#what-is-it) is a simple "microservice" which returns the local-time for a given timezone in both unixtime and ISO8601 format. The worldTimeAPI connector supports to get the current time based on a request with a timezone and additional information including whether that timezone is currently in Daylight Savings Time, when DST starts and ends, the UTC offset, etc.

## Quickstart
* Listing all time zone as json
### Step 1 - Import connector
```ballerina
ballerinax/worldtimeapi
```

### Step 2 - Create a new connector instance
```ballerina
worldtimeapi:Client baseClient = check new Client();
```
### Step 3 - Invoke  connector operation
1. Invoke connector operations using the client
```ballerina
    worldtimeapi:ListJsonResponse output = check baseClient->listTimezones();
```
2. Use `bal run` command to compile and run the Ballerina program. 

