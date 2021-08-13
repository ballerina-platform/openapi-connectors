## Overview
This is a generated connector for [Google Discovery REST API v1](https://developers.google.com/discovery/v1/reference) OpenAPI specification.
The Google Discovery API provides information about other Google APIs, such as what APIs are available, the resource, and method details for each API.

# Quickstart
To use the Google Discovery connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.discovery` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.discovery;
```

### Step 2: Create a new connector instance
Create a connector client instance
```ballerina
discovery:Client baseClient = check new;
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve list of available google apis

    ```ballerina
    public function main() {
        discovery:DirectoryList|error response = baseClient->listAPIList();
        if (response is discovery:DirectoryList) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
