## Overview

This is a generated connector from [Quickbase API v1](https://developer.quickbase.com/) OpenAPI Specification. 

The Quickbase JSON RESTful API provides secure access to Quickbase apps and allow users to manage access using Quickbase roles. Users can automate the app lifecycle using the Quickbase API. 

## Prerequisites

* Create [Quickbase](https://www.quickbase.com/) account.
    - Choose a subscription that matches with your requirements
* Obtain user token and provide the token as the value of `Authorization` header within an API call. 
    - Follow [this guide](https://developer.quickbase.com/auth) for more details on obtaining user tokens. 

## Quickstart

To use the Quickbase connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector

```ballerina
    import ballerinax/quickbase;
```

### Step 2: Create a new connector instance

Initialize the connector instance.

```ballerina
    quickbase:Client baseClient = check new Client();
};
```

### Step 3: Invoke  connector operation

1. Obtain current weather data by city name.

```ballerina
    configurable string & readonly userToken = ?;
    string appId = "bpqe82s1";
    string qbRealmHost = "demo.quickbase.com";
    json appData = check baseClient->getApp(appId, qbRealmHost, userToken);

```
2. Use `bal run` command to compile and run the Ballerina program.
