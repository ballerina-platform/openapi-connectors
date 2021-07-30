## Overview

This is a generated connector for [Chaingateway API v1.0](https://chaingateway.io/docs-ethereum) OpenAPI specification. 

This is the REST API to build the bridge between Ethereum and the real world. All of the integrations communicates with chaingateway.io through this API.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Chaingateway.io Account](https://chaingateway.io/register)
* Obtaining tokens
    Log into [Chaingateway.io Account](https://chaingateway.io/login) and obtain the necessary API key.

## Quickstart

To use the Chaingateway connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/chaingateway module into the Ballerina project.
```ballerina
import ballerinax/chaingateway;
```
### Step 2: Create a new connector instance
You can initialize the client as follows. You can now provide the API key obtained from the [Chaingateway.io](https://chaingateway.io/account) in the configuration.
```ballerina
chaingateway:ApiKeysConfig config = {
    apiKeys: {
        Authorization: "<API_KEY>"
    }
}
chaingateway:Client baseClient = check new Client(config);
```
### Step 3: Invoke connector operation
1. You can use this function to get gas price of Ethereum.
    ```ballerina
    chaingateway:GetGasPrice gasPrice = check baseClient->getGasPrice("json");
    ``` 
2. Use `bal run` command to compile and run the Ballerina program
