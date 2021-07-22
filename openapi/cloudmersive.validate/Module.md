## Overview
Cloudmersive Validate API provide capabilities for validation of data.

Ballerina connector for Cloudmersive Validate allows easy integration with Cloudmersive Validate REST API via Ballerina language. 
It supports functionalities to for email address, phone number, street address VAT number, Domain name and name validation

This module supports Cloudmersive Validate REST API `v1` version.
 
## Configuring the connector
### Prerequisites
- A Cloudmersive Account

### Obtaining tokens
Follow these steps to obtain the required token

1. Login to the Cloudmersive account
2. Visit `API Keys` tab on sidebar
3. Click `Create Key` button

## Quickstart
### Parsing unstructured input text string into an international, formatted address
#### Step 1: Import cloudmersive.validate module
First, import the ballerinax/cloudmersive.validate module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.validate;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token.
```ballerina
validate:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

validate:Client baseClient = check new Client(clientConfig);

```
#### Step 3: Obtain the parsed address

```ballerina
validate:ParseAddressRequest address = {
    AddressString: "Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522 (257) 563-7401",
    CapitalizationMode: "UpperCase"
};

validate:ParseAddressResponse|error bEvent = baseClient->addressParseString(address);

if (bEvent is validate:ParseAddressResponse) {
    log:printInfo("Parsed address: " + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}

``` 