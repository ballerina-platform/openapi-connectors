## Overview
Cloudmersive Virus Scan API provide capabilities to scan files and content for viruses and security threats. This platform 
leverage continuously updated signatures for millions of threats.

Ballerina connector for Cloudmersive Virus Scan allows easy integration with Cloudmersive Virus Scan REST API via Ballerina language. 
It allows advanced high-performance scanning capabilities on files, websites and resources in other cloud providers such as Azure,
AWS and Google Cloud.

This module supports Cloudmersive Virus Scan REST API `v1` version.
 
## Configuring the connector
### Prerequisites
- A Cloudmersive Account

### Obtaining tokens
Follow these steps to obtain the required token

1. Login to the Cloudmersive account
2. Visit `API Keys` tab on sidebar
3. Click `Create Key` button

## Quickstart
### Scan a website for viruses
#### Step 1: Import cloudmersive.validate module
First, import the ballerinax/cloudmersive.virusscan module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.virusscan;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token.
```ballerina
virusscan:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

virusscan:Client baseClient = check new Client(clientConfig);

```
#### Step 3: Get the scan result
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