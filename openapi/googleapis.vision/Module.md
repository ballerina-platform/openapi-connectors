## Overview
This is a generated connector for [Google Cloud Vision API v1](https://cloud.google.com/vision/docs/reference/rest) OpenAPI specification.
The Google Cloud Vision API provides an interface for integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)

## Quickstart
To use the Google Cloud Vision connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.vision` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.vision;
```

### Step 2: Create a new connector instance
Create a `vision:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
vision:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};
vision:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to run image dection

    ```ballerina
    public function main() {
        vision:BatchAnnotateImagesRequest request = {
            requests: [
                {
                    features: [
                        {
                            'type: "WEB_DETECTION"
                        }
                    ],
                    image: {
                        'source: {
                            imageUri: "https://thumbs.dreamstime.com/b/golden-retriever-dog-21668976.jpg"
                        }
                    }
                }
            ]
        };
        vision:BatchAnnotateImagesResponse|error response = baseClient->runImageDetectionAndAnnotation(request);
        if (response is vision:BatchAnnotateImagesResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.