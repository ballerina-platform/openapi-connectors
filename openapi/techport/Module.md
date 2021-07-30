## Overview
This is a generated connector from [Techport](https://techport.nasa.gov/home) OpenAPI Specification. The NASA Techport API allows developers to access data on technologies funded and developed by NASA in a machine-readable format. NASA develops technologies in a variety of areas such as propulsion, nanotechnology, robotics, and human health. Developers can export Techport data into either XML or JSON format.. More about the Techport API can be find at [Techport API](https://data.nasa.gov/developer/external/techport/techport-api.pdf)
 
This module supports Techport API version v3.4.0.

## Quickstart
To use the Techport connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/techport module into the Ballerina project.
```ballerina
import ballerinax/techport;
```
### Step 2: Create a new connector instance
You can now initialize the client.
```ballerina
techport:Client baseClient = check new;
```
### Step 3: Obtain project information since 2000-01-01 date

```ballerina
techport:ProjectIdResponse response = check baseClient->getProjectsSince("2000-01-01");
```
