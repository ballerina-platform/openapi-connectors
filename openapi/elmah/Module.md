## Overview
Elmah.io is an easy error logging and uptime monitoring service for .NET web applications which uses ELMAH 
(Error Logging Modules and Handlers). It provides powerful search, custom rules, integration with issue trackers, 
API and much more.


Ballerina connector for Elmah.io allows easy integration with Elmah.io REST API via Ballerina language. 

This module supports Elmah.io REST API `v3` version.
 
## Prerequisites
* Create an [Elmah account](https://elmah.io)
* Obtaining tokens
    - Use [this](https://docs.elmah.io/where-is-my-api-key/) guide to obtain the API key related to your account
    - Configure the API key to have [necessary permissions](https://docs.elmah.io/how-to-configure-api-key-permissions/)
* Configure the connector with obtained tokens


## Quickstart

To use the Elmah.io connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.pipeline module into the Ballerina project.
```ballerina
import ballerinax/elmah;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
elmah:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

elmah:Client baseClient = check new Client(config);

```
### Step 3 - Invoke connector operation

1. Create a deployment

```ballerina
elmah:CreateDeployment dep = {
    'version: "0.1.8",
    created: "2021-07-28T11:26:00.834Z"
};

elmah:CreateDeploymentResult|error bEvent = baseClient->deploymentsCreate(dep);

if (bEvent is elmah:CreateDeploymentResult) {
    log:printInfo("Deplyment" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

2. List deployments

```ballerina
elmah:Deployment[]|error bEvent = baseClient->deploymentsGetAll();

if (bEvent is elmah:Deployment[]) {
    log:printInfo("Deployment list" + bEvent.toString());
} else {
     log:printError((msg = bEvent.message());
}
```

3. Use `bal run` command to compile and run the Ballerina program
