## Overview
Cloudmersive Security API provide capabilities to detect and block security threats. 

Ballerina connector for Cloudmersive Security allows easy integration with Cloudmersive Security REST API via Ballerina language. 
It allows advanced high-performance scanning capabilities on files for SQL Injection attacks and threats, insecure deserialization attacks and threats,
XML External Entity attacks and threats, XSS attacks and threats,  Server-Side Request Forgery (SSRF) threats and attacks, bots and other threats.

This module supports Cloudmersive Security REST API `v1` version.
## Prerequisites
* Create a Cloudmersive Account
* Obtaining tokens
    1. [Login to the Cloudmersive account](https://account.cloudmersive.com/login)
    2. [Obtain API keys](https://account.cloudmersive.com/keys)

## Quickstart
To use the Cloudmersive Security connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import cloudmersive.security module
First, import the ballerinax/cloudmersive.security module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.security;
```
### Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token.
```ballerina
security:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

security:Client baseClient = check new Client(clientConfig);

```
### Step 3: Scan the query for SQL Injection
```ballerina
string query = "SELECT * FROM Users WHERE UserId = 105 OR 1=1;";
security:StringSqlInjectionDetectionResult|error bEvent = baseClient->contentThreatDetectionCheckSqlInjectionString(query);

if (bEvent is security:StringSqlInjectionDetectionResult) {
    log:printInfo("Threat Report: " + bEvent.toString());
} else {
    test:assertFail(msg = bEvent.toString());
}

``` 