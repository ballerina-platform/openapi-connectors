## Overview
This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.

The Cloudmersive Virus Scan API lets you scan files and content for viruses and identify security issues with content.
 
## Prerequisites
* Create a [Cloudmersive](https://account.cloudmersive.com) account
* Obtain tokens
    - Use [this](https://account.cloudmersive.com/keys) guide to obtain the API key related to your account.

## Quickstart
To use the Cloudmersive Virus Scan connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/cloudmersive.virusscan module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.virusscan;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
virusscan:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

virusscan:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation

1. Get the scan result
```ballerina
virusscan:WebsiteScanRequest address = {
    Url: "https://www.yahoo.com/"
};

virusscan:WebsiteScanResult|error bEvent = baseClient->scanWebsite(address);

if (bEvent is virusscan:WebsiteScanResult) {
    log:printInfo("Result: " + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}
```

2. Use `bal run` command to compile and run the Ballerina program
