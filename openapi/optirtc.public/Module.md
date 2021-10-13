## Overview
This is a generated connector for [Optirtc Public API v1.0](https://docs.optirtc.com/api/opti-publicapi-v1.html) OpenAPI specification.
The Opti Public API provides a simple, read-only interface to access metadata and the last 3 days of real-time data points of all metrics in an Opti Platform Account:
* **Web developers** can use the Public API to display real-time metrics from Opti facilities on their own websites - no backend database required.
* **Systems integrators** can use the Public API to pull data into their own GIS or ETL systems, for example, to connect real-time stormwater conditions to their existing asset management software.
* **Analysts** can use the Public API to pull data into their analysis scripts for repeated analysis.
To learn about how Opti's data-driven products are enhancing community resilience to heavy rainfall across North America, see the [Opti Home Page](https://www.optirtc.com).
OptiRTC provides simple examples of using open-source technologies to interact with the OptiRTC Public API. Find out more on our [Github page.](https://github.com/OptiRTC/OptiRTC-API-examples)

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Optirtc](https://www.optirtc.com) account
* Obtain tokens by following [this guide](https://docs.optirtc.com/api/opti-publicapi-v1.html#section/Authentication)
 
## Quickstart

To use the Optirtc connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/optirtc.public` module into the Ballerina project.
```ballerina
import ballerinax/optirtc.public;
```

### Step 2: Create a new connector instance
Create a `public:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
public:ApiKeysConfig config = {
    key: "<API_KEY>"
}
public:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get all DataStreams associated with the passed in key using the connector.

    Get all DataStreams associated with the passed in key

    ```ballerina
    public function main() {
        public:DataStreamPageResult response = check baseClient->datastream();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
