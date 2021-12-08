## Overview
This is a generated connector for [Facebook Marketing API v12.0](https://developers.facebook.com/docs/marketing-apis) OpenAPI specification. 
Facebook Marketing APIs are a collection of Graph API endpoints that can be used to help you advertise on Facebook.
## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Facebook account](https://facebook.com/).
* Obtain tokens by following [this guide](https://developers.facebook.com/docs/marketing-apis/overview/authentication).

## Quickstart

To use the Facebook Ads connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/facebook.ads` module into the Ballerina project.
```ballerina
import ballerinax/facebook.ads;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <API_KEY>.
```ballerina
ads:ApiKeysConfig clientConfig = {
    accessToken : "<API_KEY>"
};

ads:Client baseClient = check new Client(clientConfig);
```
### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to ceate a campaign using the connector. 

    ```ballerina
    public function main() {
        string adAccountId = "403797561212027";
        ads:Campaign properties = {
            name: "New Furniture Campaign",
            objective: "LINK_CLICKS",
            status: "PAUSED",
            special_ad_categories: "NONE"
        };

        ads:CampaignResponse|error result = baseClient->createCampaign(adAccountId, properties);
        if (result is ads:CampaignResponse) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
