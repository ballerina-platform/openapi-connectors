## Overview
Ballerina connector for BIS Stats is connecting the [BIS SDMX RESTful API](https://stats.bis.org/api-doc/v1/) via Ballerina language easily. This service offers programmatic access to the BIS statistical data and metadata published on the [BIS statistics pages](https://www.bis.org/statistics/index.htm) released to the public.

This module supports [BIS SDMX RESTful API v1](https://stats.bis.org/api-doc/v1/).
The BIS SDMX RESTful API v1 is a subset of the official SDMX RESTful API v1.4.0
 
## Quickstart

### Get Statistical Data from BIS 

#### Step 1: Import BIS Stats module
First, import the ballerinax/bisstats module into the Ballerina project.
```ballerina
import ballerinax/bisstats;
```
#### Step 2: Initialize the client.
You can initialize the client as follows.
```ballerina
bisstats:Client baseClient = check new Client();
```
#### Step 3: Get Statistical Data from BIS 
You can find more information about the parameters to pass [here](https://stats.bis.org/api-doc/v1/#/Data%20queries/get_data__flow___key__all).

```ballerina
public function main() {
    string|error response = baseClient->getData("BISWEB_EERDATAFLOW", "M.N.B.CH");
    if (response is string) {
        log:printInfo(response);
        xml|error x = 'xml:fromString(response);
    } else {
        log:printError(response.message());
    }
}
``` 

### Get Information about Statistical Data Availability in BIS 

#### Step 1: Import BIS Stats module
First, import the ballerinax/bisstats module into the Ballerina project.
```ballerina
import ballerinax/bisstats;
```
#### Step 2: Initialize the client.
You can initialize the client as follows.
```ballerina
bisstats:Client baseClient = check new Client();
```
#### Step 3: Get Information about Statistical Data Availability in BIS 
You can find more information about the parameters to pass [here](https://stats.bis.org/api-doc/v1/#/Data%20availability%20queries/get_availableconstraint__flow___key__all__componentID_).

```ballerina
public function main() {
    string|error response = baseClient->getDataAvailabilityInformation("BISWEB_EERDATAFLOW", "M.N.B.CH", "all");
    if (response is string) {
        log:printInfo(response);
        xml|error x = 'xml:fromString(response);
    } else {
        log:printError(response.message());
    }
}
``` 