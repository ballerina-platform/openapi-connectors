## Overview
This is a generated connector for [Adobe Analytics API](https://developer.adobe.com/analytics-apis/docs/2.0/) OpenAPI specification. 

The Adobe Analytics 2.0 APIs allow you to directly call Adobe's servers to perform almost any action that you can 
perform in the user interface. You can create reports to explore, get insights, or answer important questions about your data. 
You can also manage components of Adobe Analytics, such as the creation of segments or calculated metrics. 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Adobe Developer account](https://developer.adobe.com).
* Obtain tokens by following [this guide](https://developer.adobe.com/analytics-apis/docs/2.0/guides/).

## Quickstart

To use the Adobe Analytics connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/adobe.analytics` module into the Ballerina project.
```ballerina
import ballerinax/adobe.analytics;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
analytics:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

analytics:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list all calculated metric functions the connector. 

    ```ballerina
    public function main() {
        analytics:CalcMetricFunction[]|error result = baseClient->getCalculatedMetricFunctions();
        if (result is analytics:CalcMetricFunction[]) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
