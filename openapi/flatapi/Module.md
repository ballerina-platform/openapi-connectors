## Overview

This is a generated connector for [Flat API v2.13.0](https://flat.io/developers/docs/api/) OpenAPI specification.
The Flat API allows you to easily extend the abilities of the [Flat Platform](https://flat.io). Flat is a powerful cloud-based notation software that let you to create music scores and guitar tabs. 

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Flat Account](https://flat.io/auth/signup)
* Obtaining tokens
   1. Log into [Flat Account](https://flat.io/auth/signin)
   2. Obtain tokens - Follow [this link](https://flat.io/developers/docs/api/authentication.html)

## Quickstart

To use the Flat connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/flatapi module into the Ballerina project.
```ballerina
import ballerinax/flatapi;
```
### Step 2: Create a new connector instance
You can use Personal Access Token(PAT) for authentication:
```ballerina
flatapi:ClientConfig clientConfig = {
    auth: {
        token: <PAT_TOKEN>
    }
};

flatapi:Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.flat.io/v2");
```
### Step 3: Invoke connector operation
1. You can get detail about score created.
    ```ballerina
    flatapi:ScoreDetails score = check baseClient->getScore(<SCORE_ID>);
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
