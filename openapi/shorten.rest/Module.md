## Overview
This is a generated connector for [Shorten.REST API v1.0](https://docs.shorten.rest/) OpenAPI specification.  
The Shorten.REST API provides the capability to programmatically create short URLs for longer URL.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create a [Shorten.REST account](https://app.shorten.rest/auth).
2. Obtain tokens - Follow [this guide](https://docs.shorten.rest/#section/Authentication).

## Quickstart
To use the Shorten.REST connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/shorten.rest module into the Ballerina project.
```ballerina
import ballerinax/shorten.rest;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using the Shorten.REST API keys config.

```ballerina
rest:ApiKeysConfig & readonly apiKeyConfig = ?;
rest:Client baseClient = check new Client(apiKeyConfig);
```

### Step 3: Invoke connector operation
Following is code demonstrates how to get all aliases using `ballerinax/shorten.rest` connector. 

```ballerina
public function main() returns error? {
    rest:GetAliasesModel entity = check baseClient->getAliases();
}
```