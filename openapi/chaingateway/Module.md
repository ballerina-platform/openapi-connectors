## Overview

 Chaingateway connector consume the data exposed in https://eu.eth.chaingateway.io/v1. It is currently supporting the all the operations provided by Chaingateway API.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Chaingateway.io Account](https://chaingateway.io/register)
* Obtaining tokens

    Follow [this link](https://chaingateway.io/account) and obtain the necessary API key.

* Configure the connector with obtained tokens

## Quickstart

To use the Chaingateway connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Chaingateway module
First, import the ballerinax/chaingateway module into the Ballerina project.
```ballerina
import ballerinax/chaingateway;
```
### Step 2: Initialize the client
You can initialize the client as follows. You can now provide the API key obtained from the [Chaingateway.io](https://chaingateway.io/account) in the configuration.
```ballerina
chaingateway:ApiKeysConfig config = {
    apiKeys: {
        Authorization: "<API_KEY>"
    }
}
chaingateway:Client baseClient = check new Client(config);
```
### Step 3: Get Ethereum gas price
This returns a gas price of Ethereum.
```ballerina
chaingateway:GetGasPrice gasPrice = check baseClient->getGasPrice("json");
``` 
