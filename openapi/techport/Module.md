## Overview
This is a generated connector from [Techport REST API v3.4.0](https://techport.nasa.gov/home) OpenAPI Specification. 

This is the public REST API for TechPort. All of the integrations communicates with TechPort through this API.<br/><br/>For additional help getting started with the API, visit the following help articles:<br/><ul><li>[Using the REST API](https://data.nasa.gov/developer/external/techport/techport-api.pdf)</li></ul>
 
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
### Step 3: Invoke connector operation

1. Now you can use the operations available within the connector. Following is an example on how to obtain project information since 2000-01-01

```ballerina
techport:ProjectIdResponse response = check baseClient->getProjectsSince("2000-01-01");
```
2. Use `bal run` command to compile and run the Ballerina program.
