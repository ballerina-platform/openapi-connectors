## Overview
This is a generated connector from [ipTwist API v1](https://iptwist.com/) OpenAPI Specification. 

ipTwist is a reliable, secure, and simple IP geolocation API. More about the ipTwist API can be find at [https://iptwist.com/documentation](https://iptwist.com/documentation)
 
This module supports ipTwist API version v1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [ipTwist account](https://iptwist.com/register)
- Obtain tokens - Navigate to the [ipTwist Settings](https://iptwist.com/settings), your API key will be listed there, simply copy it. 
 
## Quickstart
To use the ipTwist connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/iptwist module into the Ballerina project.
```ballerina
import ballerinax/iptwist;
```
### Step 2: Create a new connector instance
You can now intantiate the client.

```ballerina
iptwist:ApiKeysConfig apiKeyConfig = {
    apiKeys: {
        "X-IPTWIST-TOKEN": "<API Token>"  
    }
};

iptwist:Client iptwistClient = check new(apiKeyConfig);
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to check for ip geolocation info.
```ballerina
Request req = {
    ip: "112.134.242.92"
};
bintable:Response geoLocationInfo = check baseClient->getGeoLocationInfo(req);
```
2. Use `bal run` command to compile and run the Ballerina program.
