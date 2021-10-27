## Overview
This is a generated connector for [Power BI API v1.0](https://powerbi.microsoft.com/en-us/) OpenAPI specification.

Power BI REST API provides service endpoints for embedding, administration, and user resources.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Azure account](https://azure.microsoft.com/en-us/).
* Obtain tokens by following [this guide](https://docs.microsoft.com/en-us/power-bi/developer/embedded/register-app?tabs=manual%2CAzure).

## Quickstart

To use the Power BI connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/power.bi` module into the Ballerina project.
```ballerina
import ballerinax/power.bi;
```

### Step 2: Create a new connector instance
Create a `bi:ClientConfiguration` with the `<ACCESS_TOKEN>` obtained, and initialize the connector with it.
```ballerina
bi:ClientConfiguration clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

bi:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list Attributes under a project using the connector. 

    ```ballerina
    public function main() {
        bi:Datasets|error response = baseClient->datasetsGetdatasets();
        if (response is bi:Datasets) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

