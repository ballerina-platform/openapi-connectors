## Overview
This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.

The Cloudmersive Validation APIs help you validate data. Check if an E-mail address is real. Check if a domain is real. 
Check up on an IP address, and even where it is located. All this and much more is available in the validation API.
 
## Prerequisites
* Create a [Cloudmersive](https://account.cloudmersive.com) account
* Obtain tokens
    - Use [this](https://account.cloudmersive.com/keys) guide to obtain the API key related to your account.

## Quickstart
To use the Cloudmersive Validate connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/cloudmersive.validate module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.validate;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
validate:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

validate:Client baseClient = check new Client(clientConfig);

```
### Step 3 - Invoke connector operation

1. Obtain the parsed address

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
2. Use `bal run` command to compile and run the Ballerina program
