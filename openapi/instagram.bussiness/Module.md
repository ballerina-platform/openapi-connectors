## Overview
This is a generated connector for [Instagram Graph API v12.0](https://developers.facebook.com/docs/instagram-api) OpenAPI specification. 

Instagram is a free photo-sharing application that enables its users to take photos, apply filters, and share them on social networks.  

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Instagram account](https://www.instagram.com/?hl=en).
* Obtain tokens by following [this guide](https://developers.facebook.com/docs/instagram-api/overview).

## Quickstart

To use the Instagram connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/instagram.bussiness` module into the Ballerina project.
```ballerina
import ballerinax/instagram.bussiness;
```

### Step 2: Create a new connector instance
Initialize the connector.
```ballerina
bussiness:BearerTokenConfig apiKeyConfig = {
    token = "<ACCESS_TOKEN>"
};

bussiness:Client baseClient = check new Client(apiKeyConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to get fields of a image, video, or album using the connector. 

    ```ballerina
    public function main() {
        string[] fields = ["id","username"];
        string mediaId = "2684065555656187876_50003825255";

        bussiness:MediaFieldsObject|error result = baseClient->getMediaInfo(mediaId, fields);
        if (result is bussiness:MediaFieldsObject) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

