## Overview
This is a generated connector for [DocuSign Rooms API](https://developers.docusign.com/docs/rooms-api/) OpenAPI specification. 

DocuSign Rooms streamlines real estate and mortgage workflows by connecting all parties in a digital, secure, and central workspace. With the DocuSign Rooms API, it’s easy to integrate Rooms functionality into your own solutions. 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [DocuSign account](https://www.docusign.com/).
* Obtain tokens by following [this guide](https://developers.docusign.com/docs/rooms-api/rooms101/auth/).

## Quickstart

To use the DocuSign Rooms connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/docusign.rooms` module into the Ballerina project.
```ballerina
import ballerinax/docusign.rooms;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
rooms:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

rooms:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to get account information using the connector. 

    ```ballerina
    public function main() {
        string accountID = "1234";

        rooms:AccountSummary|error result = baseClient->getAccountInformation(accountID);
        if (result is rooms:AccountSummary) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
