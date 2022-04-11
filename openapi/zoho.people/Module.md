## Overview
This is a generated connector for [Zoho People](https://www.zoho.com/people/overview.html) OpenAPI specification. 

Zoho People API provides the capability to integrate HR modules with third-party applications. With Zoho People API, you can extract employees' data and form data in XML or JSON format to develop new applications or integrate with your existing business applications.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Zoho People account](https://www.zoho.com/people/).
* Obtain tokens by following [this guide](https://www.zoho.com/people/oauth-steps.html).

## Quickstart

To use the Zoho People connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/zoho.people` module into the Ballerina project.
```ballerina
import ballerinax/zoho.people;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
people:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

people:Client zohoPeople = check new (clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to get leave types of a specific employee. 

    ```ballerina
    public function main() {
        userId = <USER_ID>
        people:LeaveTypes|error leaveTypes = zohoPeople->getLeaveTypes(userId);
        if leaveTypes is error {
            log:printError(leaveTypes.toString());
        } else {
            log:printInfo(leaveTypes.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
