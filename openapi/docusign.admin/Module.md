## Overview
This is a generated connector for [DocuSign Admin API](https://developers.docusign.com/docs/admin-api/) OpenAPI specification. 

DocuSign Admin API is for an organization administrator to manage organizations, accounts and users which enables you to automate user management with your existing systems while ensuring governance and compliance.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [DocuSign account](https://www.docusign.com/).
* Obtain tokens by following [this guide](https://developers.docusign.com/docs/admin-api/admin101/auth/).

## Quickstart

To use the DocuSign Admin connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/docusign.admin` module into the Ballerina project.
```ballerina
import ballerinax/docusign.admin;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
admin:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

admin:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list all clickwraps using the connector. 

    ```ballerina
    public function main() {
        admin:OrganizationsResponse|error result = baseClient->getOrganizationList();
        if (result is admin:OrganizationsResponse) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
