## Overview
This is a generated connector for [Google BigQuery API v2.0](https://cloud.google.com/bigquery/docs/reference/rest) OpenAPI specification.
The BigQuery API provides access to create, manage, share and query data.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens 
    1. Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google BigQuery connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.bigquery` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.bigquery;
```

### Step 2: Create a new connector instance
Create a `bigquery:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
bigquery:ClientConfig clientConfig = {authConfig : {token: "<Your access token>"}};
bigquery:Client baseClient = check new Client(clientConfig, serviceUrl = "https://bigquery.googleapis.com/bigquery/v2");
```

### Step 3: Invoke connector operation
1. Now you can invoke the connector operations as follows,

    List projects

    ```ballerina
    public function main() returns error? {
        bigquery:ProjectList projectList = check baseClient->listProjects();
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
