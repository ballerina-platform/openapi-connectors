## Overview
This is a generated connector for [BIS SDMX RESTful API v1](https://stats.bis.org/api-doc/v1/) OpenAPI specification. 
The BIS SDMX RESTful API is a subset of the official SDMX RESTful API v1.4.0, released in June 2019.
This service offers programmatic access to the BIS statistical data and metadata published on the [BIS statistics pages](https://www.bis.org/statistics/index.htm) released to the public.
For additional information about the SDMX RESTful API, check the [official sdmx-rest specification](https://github.com/sdmx-twg/sdmx-rest/tree/master/v2_1/ws/rest/docs) or the [dedicated Wiki](https://github.com/sdmx-twg/sdmx-rest/wiki), including [**useful tips for consumers**](https://github.com/sdmx-twg/sdmx-rest/wiki/Tips-for-consumers).

This module supports [BIS SDMX RESTful API v1](https://stats.bis.org/api-doc/v1/). The BIS SDMX RESTful API v1 is a subset of the official SDMX RESTful API v1.4.0
 
## Quickstart

To use the BIS Stats connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/bisstats` module into the Ballerina project.
```ballerina
import ballerinax/bisstats;
```

### Step 2: Create a new connector instance
Initialize the connector.
```ballerina
bisstats:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get statistical Data from BIS using the connector. You can find more information about the parameters to pass [here](https://stats.bis.org/api-doc/v1/#/Data%20queries/get_data__flow___key__all).

    Get Statistical Data from BIS 

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

    Following is an example on how to get information about statistical data availability in BIS using the connector. You can find more information about the parameters to pass [here](https://stats.bis.org/api-doc/v1/#/Data%20availability%20queries/get_availableconstraint__flow___key__all__componentID_).

    Get Information about Statistical Data Availability in BIS 

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

2. Use `bal run` command to compile and run the Ballerina program.
