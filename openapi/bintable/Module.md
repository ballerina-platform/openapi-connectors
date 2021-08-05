## Overview
This is a generated connector from [BINTable API v1](https://bintable.com/get-api) OpenAPI Specification. 

The BINTable database has a large dataset of card Issuer identification number (IIN) sometimes referred to as the Bank Identification Number (BIN) information. More about the BINTable API can be find at [BINTable](https://bintable.com/get-api)
 
This module supports BINTable API version v1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [BINTable account](https://bintable.com/get-api)
- Obtain tokens - Navigate to the [BINTable Profile](https://bintable.com/login), your API key will be listed there, simply copy it. 
 
## Quickstart
To use the BINTable connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/bintable module into the Ballerina project.
```ballerina
import ballerinax/bintable;
```
### Step 2: Create a new connector instance
You can now intantiate the client.

```ballerina

bintable:Client bintableClient = check new;
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to check for BIN code.
```ballerina
bintable:ResponseItem balanceLookup = check bintableClient->binLookup("<BIN code>", "<API_Key>");
```
2. Use `bal run` command to compile and run the Ballerina program.
