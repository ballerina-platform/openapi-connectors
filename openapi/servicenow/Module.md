## Overview

This is a generated connector for [ServiceNow REST API Quebec version](https://developer.servicenow.com/dev.do#!/reference/api/quebec/rest) OpenAPI Specification.

ServiceNow provides extensive access to instances through a set of RESTful APIs.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

1. Create a [ServiceNow instance](https://developer.servicenow.com/dev.do) (If you already have one, you can use that).

2. Obtain tokens - Follow [this guide](https://docs.servicenow.com/bundle/quebec-platform-administration/page/administer/security/task/t_SettingUpOAuth.html).
 
## Quickstart

To use the `ServiceNow` connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
Import the ballerinax/servicenow module into the Ballerina project.

```ballerina
import ballerinax/servicenow;
```

### Step 2: Create a new connector instance.
You can now make the connection configuration using either one of the following, and initialize the connector with it.

- The OAuth2 refresh token grant config.

```ballerina
 ClientConfig clientConfig = {
     authConfig : {
         refreshUrl : "<YOUR INSTANCE URL>/oauth_token",
         refreshToken : "<REFRESH TOKEN>",
         clientId : "<CLIENT ID>",
         clientSecret : "<CLIENT SECRET>"
     }
 };

servicenow:Client servicenowClient = check new (configuration, serviceUrl = <YOUR INSTANCE URL>);
```
- The bearer token config.

```ballerina
 ClientConfig clientConfig = {
     authConfig : {
         token : "<YOUR ACCESS TOKEN>"
     }
 };

servicenow:Client servicenowClient = check new (configuration, serviceUrl = <YOUR INSTANCE URL>);
```
- The credentials config (with username and password).

```ballerina
 ClientConfig clientConfig = {
    authConfig : {
        username: "<USERNAME>",
        password: "<PASSWORD>"
    }
 };

servicenow:Client servicenowClient = check new (configuration, serviceUrl = <YOUR INSTANCE URL>);
```

### Step 3: Invoke  connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.
Following is an example on how to insert a record to a table using `ballerinax/servicenow` connector. 

```ballerina
public function main() returns error? {
    string tableName = "incident

    json payload =  {
        "short_description":"Unable to connect to office wifi",
        "assignment_group":"287ebd7da9fe198100f92cc8d1d2154e",
        "urgency":"2",
        "impact":"2"};

    json response = check servicenowClient->createRecord(tableName, payload);
}
```
2. Use `bal run` command to compile and run the Ballerina program.
