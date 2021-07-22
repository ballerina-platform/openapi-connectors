## Overview

The ServiceNow connector allows you to consume `Table API`, `Case API`, `Contact API`, `Aggregate API`, and 
`Import Set API` related operations of the ServiceNow REST API from Ballerina. 

This module supports [ServiceNow REST API](https://developer.servicenow.com/dev.do#!/reference/api/quebec/rest) version Quebec.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

- Create a [ServiceNow instance](https://developer.servicenow.com/dev.do) (If you already have one, you can use that).

- Obtaining tokens - Follow [this link](https://docs.servicenow.com/bundle/quebec-platform-administration/page/administer/security/task/t_SettingUpOAuth.html).

- Configure the connector with obtained tokens
 
## Quickstart

To use the `ServiceNow` connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import ServiceNow module
First, import the ballerinax/servicenow module into the Ballerina project.

```ballerina
import ballerinax/servicenow;
```

### Step 2: Configure the connection credentials.
You can now make the connection configuration using either one of the following.

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

### Step 3: Insert a record to a table
Following is code demonstrates how to insert a record to a table using `ballerinax/servicenow` connector. 

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

## Quick reference 
Code snippets of some frequently used functions: 

- Get all records of a table
    ```ballerina
    string tableName = <TABLE NAME>
    json|error response = servicenowClient->getRecordList(tableName);
    ```
    
- Get a record by id from a table . 
    ```ballerina
    string tableName = <TABLE NAME>
    string sysId = <SYS ID OF THE RECORD >
    json|error response = servicenowClient->getRecordById(tableName,sysId);
    ```
 
- Update a record by id 
    ```ballerina
    string tableName = "incident"
    string sysId = <SYS ID OF THE RECORD >
    json payload = {
                    "assigned_to":"681b365ec0a80164000fb0b05854a0cd",
                    "urgency":"4",
                    "comments":"Elevating urgency, this is a blocking issue"
                    };
    json|error response = servicenowClient->updateRecord(tableName,sysId,payload);
    ```

- Delete a record
    ```ballerina
    string tableName = <TABLE NAME>
    string sysId = <SYS ID OF THE RECORD >
    json|error response = servicenowClient->deleteRecord(tableName,sysId);
    ```
