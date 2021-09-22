## Overview
WorldTimeAPI is a simple web service which returns the local-time for a given timezone as either JSON or plain-text. Some additional information is provided, such as whether that timezone is currently in Daylight Savings Time, when DST starts and ends, the UTC offset, etc. It supports the following operations.
* Get Current Time
* Get Current Time As Text
* Get Current Time Based On Ip
* Get Current Time Based On Ip As Text
* Get Current Time Based On Ipv4
* Get Current Time Based On Ipv4 As Text
* Get Current Time By Region
* Get Current Time By Region As Text
* Get Timezone By Area
* Get TimezoneBy Area As Text
* List Timezones
* List Timezones As Text
 
This module supports 0.6.1 version.
  
## Quickstart
* Listing all time zone as json
### Step 1: Import the module 
```ballerina
ballerinax/worldtimeapi
```

### Step 2:  Create a client
```ballerina
worldtimeapi:Client baseClient = check new Client();
```
### Step 3:  Use the client to call its remote functions as the following code
```ballerina
    worldtimeapi:ListJsonResponse output = check baseClient->listTimezones();
```
## Quick reference 
Code snippets of some frequently used functions: 
* Get time zones by area
Find more details on areas from [here](http://worldtimeapi.org/)
 ```ballerina
   worldtimeapi:ListJsonResponse response = check baseClient->getTimezoneByArea("<Area>");
```
* Get current time based on IP address
```ballerina
   worldtimeapi:DateTimeJsonResponse response = check baseClient->getCurrentTimeBasedOnIp();
```