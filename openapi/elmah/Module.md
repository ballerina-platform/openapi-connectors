## Overview
This is a generated connector for [Elmah.io REST API v3](https://elmah.io) OpenAPI Specification.
 
The public REST API for elmah.io. All of the integrations communicates with elmah.io through this API.

For additional help getting started with the API, visit the following help articles:
<ul><li>[Using the REST API](https://docs.elmah.io/using-the-rest-api/)</li><li>[Where is my API key?](https://docs.elmah.io/where-is-my-api-key/)</li><li>[Where is my log ID?](https://docs.elmah.io/where-is-my-log-id/)</li><li>[How to configure API key permissions](https://docs.elmah.io/how-to-configure-api-key-permissions/)</li></ul>
 
## Prerequisites
* Create an [Elmah](https://elmah.io) account
* Obtain tokens
    - Use [this](https://docs.elmah.io/where-is-my-api-key/) guide to obtain the API key related to your account
    - Configure the API key to have [necessary permissions](https://docs.elmah.io/how-to-configure-api-key-permissions/)

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
