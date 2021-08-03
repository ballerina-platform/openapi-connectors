## Overview
The NASA Techport API allows developers to access data on technologies funded and developed by NASA in a machine-readable format. NASA develops technologies in a variety of areas such as propulsion, nanotechnology, robotics, and human health. Developers can export Techport data into either XML or JSON format.. More about the Api2Pdf API can be find at [Techport API](https://data.nasa.gov/developer/external/techport/techport-api.pdf)
 
This module supports Techport API version v3.4.0.

## Quickstart
To use the ExchangeRates connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import ExchangeRates module
First, import the ballerinax/exchangerates module into the Ballerina project.
```ballerina
import ballerinax/exchangerates;
```
### Step 2: Initialize Techport client
You can now initialize the client.
```ballerina
techport:Client baseClient = check new;
```
### Step 3: Obtain projects information since 2000-01-01 date

```ballerina
techport:InlineResponse200 response = check baseClient->projects("2000-01-01");
```
