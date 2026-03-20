## Overview
The DocuSign Monitor API connector(https://developers.docusign.com/docs/monitor-api/monitor101/) OpenAPI specification. 

DocuSign Monitor helps organizations protect their agreements with round-the-clock activity tracking. 
The Monitor API delivers this activity tracking information directly to existing security stacks or data visualization 
tools—enabling teams to detect unauthorized activity, investigate incidents, and quickly respond to verified threats. 
It also provides the flexibility security teams need to customize dashboards and alerts to meet specific business needs.

### Key Features

- Programmatic access to create and manage resources via REST API
- Access analytics, reports, and performance metrics
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [DocuSign account](https://www.docusign.com/).
* Obtain tokens by following [this guide](https://developers.docusign.com/docs/monitor-api/monitor101/auth/).

## Quickstart

To use the DocuSign Monitor connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/docusign.monitor` module into the Ballerina project.
```ballerina
import ballerinax/docusign.monitor;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
monitor:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

monitor:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list datasets using the connector. 

    ```ballerina
    public function main() {
        monitor:CursoredResult|error result = baseClient->getDatasetsByDataSetName();
        if (result is monitor:CursoredResult) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
