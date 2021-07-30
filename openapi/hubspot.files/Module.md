## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

These APIs allow to upload and manage files.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot Files connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
First, import the ballerinax/hubspot.files module into the Ballerina project.
```ballerina
import ballerinax/hubspot.files;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
files:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

files:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation

1. Upload a file
```ballerina
files:Body payload = {
    file: "",
    fileName: ""
};

files:File|error bEvent = baseClient->filesUpload(payload);
if (bEvent is files:File) {
    log:printInfo("Created File");
} else {
    log:printInfo(msg = bEvent.message());
}
```

2. Use `bal run` command to compile and run the Ballerina program
