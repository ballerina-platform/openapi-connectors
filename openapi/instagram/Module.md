## Overview
This is a generated connector for [Instagram Basic Display API v12.0](https://developers.facebook.com/docs/instagram-basic-display-api) OpenAPI specification. 

Instagram is a free photo-sharing application that enables its users to take photos, apply filters, and share them on social networks. The Instagram Basic Display API allows users of your app to get basic profile information, photos, and videos in their Instagram accounts.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Instagram account](https://www.instagram.com/?hl=en).
* Obtain tokens by following [this guide](https://developers.facebook.com/docs/instagram-basic-display-api/overview#instagram-user-access-tokens).

## Quickstart

To use the Instagram connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/instagram` module into the Ballerina project.
```ballerina
import ballerinax/instagram;
```

### Step 2: Create a new connector instance
Create a `instagram:ApiKeysConfig` with the `<ACCESS_TOKEN>` obtained, and initialize the connector with it.
```ballerina
instagram:ApiKeysConfig apiKeyConfig = {
    accessToken = "<ACCESS_TOKEN>"
};

instagram:Client baseClient = check new Client(apiKeyConfig);

```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to get fields of a image, video, or album using the connector. 

    ```ballerina
    public function main() {
        string[] fields = ["id","username"];
        string mediaId = "2684065555656187876_50003825255";

        instagram:MediaFieldsObject|error result = baseClient->getMedia(mediaId, fields);
        if (result is instagram:MediaFieldsObject) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

