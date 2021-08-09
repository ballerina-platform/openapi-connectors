## Overview
This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.

The  Cloudmersive Barcode APIs let you generate barcode images, and recognize values from images of barcodes.
 
### Prerequisites
* Create a [Cloudmersive](https://account.cloudmersive.com) account
* Obtain tokens
    - Use [this](https://account.cloudmersive.com/keys) guide to obtain the API key related to your account.

## Quickstart

To use the Cloudmersive Barcode connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/cloudmersive.barcode module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.barcode;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
barcode:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

barcode:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation

1. Lookup EAN barcode

```ballerina
barcode:BarcodeLookupResponse|error bEvent = baseClient->barcodeEanLookup("4 605664 00005");

if (bEvent is barcode:BarcodeLookupResponse) {
    log:printInfo("Product data: " + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}
``` 
2. Use `bal run` command to compile and run the Ballerina program
