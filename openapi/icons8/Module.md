## Overview
This is a generated connector for [Icons8 API v3.0](https://developers.icons8.com/docs/getting-started) OpenAPI specification.  
The Icons8 API provides the capability to search and obtain icons.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Icons8 account](https://icons8.com/).
2. Obtain tokens - Follow [this guide](https://developers.icons8.com/).

## Quickstart
To use the Icons8 connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/icons8 module into the Ballerina project.
```ballerina
import ballerinax/icons8;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using the Icons8 API keys config.

```ballerina
icons8:ApiKeysConfig & readonly apiKeyConfig = ?;
icons8:Client iconsClient = check new (apiKeyConfig);
```

### Step 3: Invoke connector operation
Following is code demonstrates how to get icons created after a date using `ballerinax/icons8` connector. 

```ballerina
public function main() returns error? {
    icons8:TotalsResponse response = check iconsClient->getTotals("2014-12-31");
}
```