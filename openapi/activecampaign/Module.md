## Overview
This is a generated connector for [ActiveCampaign API version 3](https://developers.activecampaign.com/reference/overview) OpenAPI specification.

ActiveCampaign is an integrated email marketing, automation, sales software, and CRM platform. It lets users perform powerful automation, email marketing, and customer relationship management.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [ActiveCampaign Account](https://www.activecampaign.com).
* Obtain tokens by following [this guide](https://developers.activecampaign.com/reference/authentication).

## Quickstart

To use the ActiveCampaign connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/activecampaign` module into the Ballerina project.
```ballerina
import ballerinax/activecampaign;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using the <API_TOKEN>.
```ballerina
activecampaign:ApiKeysConfig apiKeyConfig = {
    apiToken:"<API_TOKEN>"
};

activecampaign:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
Now you can use the operations available within the connector. Note that they are in the form of remote operations.

Following is an example to list contacts using the connector. 

```ballerina
public function main() {
    activecampaign:AccountListResponse|error result = baseClient->listAccounts();
    if (result is activecampaign:AccountListResponse) {
        log:printInfo(result.toString());
    } else {
        log:printInfo(result.toString());
    }
}
``` 

2. Use `bal run` command to compile and run the Ballerina program.
