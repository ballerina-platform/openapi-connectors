## Overview
This is a generated connector for [DocuSign Click API](https://developers.docusign.com/docs/click-api/) OpenAPI specification. 

DocuSign Click lets you capture consent to standard agreement terms with a single click terms and conditions, terms of service, terms of use, privacy policies, and more. The Click API lets you include this customizable clickwrap solution in your DocuSign integrations.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [DocuSign account](https://www.docusign.com/).
* Obtain tokens by following [this guide](https://developers.docusign.com/docs/click-api/click101/auth/).

## Quickstart

To use the DocuSign Click connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/docusign.click` module into the Ballerina project.
```ballerina
import ballerinax/docusign.click;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
click:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

click:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list all clickwraps using the connector. 

    ```ballerina
    public function main() {
        click:ClickwrapVersionsResponse|error result = baseClient->getClickwraps();
        if (result is click:ClickwrapVersionsResponse) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
