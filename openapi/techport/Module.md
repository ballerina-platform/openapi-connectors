## Overview
The NASA Techport API allows developers to access data on technologies funded and developed by NASA in a machine-readable format. NASA develops technologies in a variety of areas such as propulsion, nanotechnology, robotics, and human health. Developers can export Techport data into either XML or JSON format.. More about the Api2Pdf API can be find at [Techport API](https://data.nasa.gov/developer/external/techport/techport-api.pdf)
 
This module supports v3.4.0 version.

## Quickstart

### Creating the Client

To use the connector, first you must create a `techport:Client` object. The samples for creating a Techport client can be found below.

```ballerina

techport:Client baseClient = check new;
```

### Obtain project information since 2000-01-01 date

```ballerina
techport:InlineResponse200 response = check baseClient->projects("2000-01-01");
```
