## Overview
This is a generated connector for [Google BigQuery Data Transfer API v1](https://cloud.google.com/bigquery-transfer/docs/reference/datatransfer/rest) OpenAPI specification.
The BigQuery Data Transfer API provides access schedule queries or transfer external data from SaaS applications to Google BigQuery on a regular basis..

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens by following [this link](https://developers.google.com/identity/protocols/oauth2)

## Quickstart

To use the Google BigQuery connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.bigquery.datatransfer` module into the Ballerina project.
```ballerina
    import ballerinax/googleapis.bigquery.datatransfer;
```

### Step 2: Create a new connector instance
Create a `datatransfer:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
    datatransfer:ClientConfig clientConfig = {auth : {token: "<Your access token>"}};
    datatransfer:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can invoke the connector operations as follows,

    List projects

    ```ballerina
    public function main() returns error? {
        datatransfer:TransferRun runInfo = check baseClient->getTransferRun(name);
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.