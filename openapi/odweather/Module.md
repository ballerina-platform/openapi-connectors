## Overview
This is a generated connector for [ODWeather API v1.0](https://api.oceandrivers.com/) OpenAPI specification.
The ODWeather API provides the capability to access the real time and forecast ocean information.

## Quickstart
To use the ODWeather connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
Import the ballerinax/odweather module into the Ballerina project.
```ballerina
import ballerinax/odweather;
```

### Step 2: Create a new connector instance
```ballerina
odweather:Client weatherClient = check new();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.  
Following is an example on how to get web cams information using the connector.

    ```ballerina
    public function main() returns error? {
        http:Response entity = check weatherClient->getWebCams()();
    }
    ```
2. Use `bal run` command to compile and run the Ballerina program.