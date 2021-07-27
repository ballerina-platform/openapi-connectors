## Overview
Cloudmersive Barcode API provide capabilities to generate and recognize 1D and 2D barcodes.

Ballerina connector for Cloudmersive Barcode allows easy integration with Cloudmersive Barcode REST API via Ballerina language. 
It allows scanning photos of barcodes to text, generate 1D barcodes and generate 2D barcodes

This module supports Cloudmersive Barcode REST API `v1` version.
 
### Prerequisites
* Create a Cloudmersive Account
* Obtaining tokens
    1. [Login to the Cloudmersive account](https://account.cloudmersive.com/login)
    2. [Obtain API keys](https://account.cloudmersive.com/keys)

## Quickstart

To use the Cloudmersive Barcode connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import cloudmersive.barcode module
First, import the ballerinax/cloudmersive.barcode module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.barcode;
```
### Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token.
```ballerina
barcode:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

barcode:Client baseClient = check new Client(clientConfig);

```
### Step 3: Lookup EAN barcode

```ballerina
barcode:BarcodeLookupResponse|error bEvent = baseClient->barcodeEanLookup("4 605664 00005");

if (bEvent is barcode:BarcodeLookupResponse) {
    log:printInfo("Product data: " + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}

``` 