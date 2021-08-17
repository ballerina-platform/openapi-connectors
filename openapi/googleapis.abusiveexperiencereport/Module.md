## Overview
This is a generated connector for [Google Abusive Experience Report API v1](https://developers.google.com/abusive-experience-report/) OpenAPI specification.
Views Abusive Experience Report data, and gets a list of sites that have a significant number of abusive experiences.
 
## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/abusive-experience-report/v1/how-tos/authorizing)

## Quickstart

To use the Google Abusive Experience Report connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.abusiveexperiencereport` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.abusiveexperiencereport;
```

### Step 2: Create a new connector instance
Initialize the connector. 
```ballerina
abusiveexperiencereport:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list sites that are failing in the Abusive Experience Report using the connector. 

    Lists sites that are failing in the Abusive Experience Report

    ```ballerina
    public function main() {
        abusiveexperiencereport:ViolatingSitesResponse|error response = baseClient->listViolatingsites('key = "<API_KEY>");
        if (response is abusiveexperiencereport:ViolatingSitesResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
