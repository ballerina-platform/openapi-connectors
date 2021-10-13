## Overview
This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.

The Cloudmersive Security APIs help you detect and block security threats.

## Prerequisites
* Create a [Cloudmersive](https://account.cloudmersive.com) account
* Obtain tokens
    - Use [this](https://account.cloudmersive.com/keys) guide to obtain the API key related to your account.

## Quickstart
To use the Cloudmersive Security connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/cloudmersive.security module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.security;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
security:ApiKeysConfig config = {
    apikey : "<your apiKey>"
};

security:Client baseClient = check new Client(clientConfig);

```
### Step 3 - Invoke connector operation

1. Scan the query for SQL Injection
```ballerina
string query = "SELECT * FROM Users WHERE UserId = 105 OR 1=1;";
security:StringSqlInjectionDetectionResult|error bEvent = baseClient->contentThreatDetectionCheckSqlInjectionString(query);

if (bEvent is security:StringSqlInjectionDetectionResult) {
    log:printInfo("Threat Report: " + bEvent.toString());
} else {
    test:assertFail(msg = bEvent.toString());
}

``` 
2. Use `bal run` command to compile and run the Ballerina program
