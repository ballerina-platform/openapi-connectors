## Overview
This is a generated connector for [Salesforce Pardot API v5](https://developer.salesforce.com/docs/marketing/pardot/guide/version5overview.html) OpenAPI specification.

The version 5 of the Pardot API to read and update a variety of assets and objects, like File and Layout Template objects.
## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Salesforce Account](https://www.salesforce.com).
* Obtain tokens by following [this guide](https://developer.salesforce.com/docs/marketing/pardot/guide/authentication.html).

## Quickstart

To use the Salesfore Pardot connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/salesforce.pardot` module into the Ballerina project.
```ballerina
import ballerinax/salesforce.pardot;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
pardot:ClientConfig clientConfig = {
    auth : {
        token: token
    }
};

pardot:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation

Now you can use the operations available within the connector. Note that they are in the form of remote operations.

Following is an example to get data of a campaign using the connector.

```ballerina
public function main() {
     string fieldsToRead = "id,name,isDeleted";
     string campaignId = "7015g000000LioNAAS";

     pardot:Record|error data = baseClient->readCampaign(fieldsToRead, campaignId);
     if (data is pardot:Record) {
          log:printInfo("Campaign " + data.toString());
     } else {
          log:printInfo("Error Occured");
     }
}
``` 

2. Use `bal run` command to compile and run the Ballerina program.
