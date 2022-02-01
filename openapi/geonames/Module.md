## Overview

This is a generated connector for [Geonames API](https://www.geonames.org/export/JSON-webservices.html) OpenAPI specification.
The Geonames API allows you to retrieve information about geo locations.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Geonames Account](https://www.geonames.org/export/JSON-webservices.html)
* Obtaining tokens by following [this link](https://www.geonames.org/export/web-services.html) 

## Quickstart

To use the Geonames connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/geonames module into the Ballerina project.
```ballerina
import ballerinax/geonames;
```
### Step 2: Create a new connector instance
You can use your organization name for authentication:
```ballerina
geonames:ApiKeysConfig apiKeyConfig = {
    username: <USERNAME>
};

geonames:Client baseClient = check new Client(apiKeyConfig);
```
### Step 3: Invoke connector operation
1. You can search about a term.
    ```ballerina
    geonames:SearchResponse score = check baseClient->search("sanfrancisco");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
