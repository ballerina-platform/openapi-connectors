## Overview
This is a generated connector for [IRIS Subscriptions API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
Connect with the Subscriptions API to create, view, and manage your event notification subscriptions.  
A webhook listener URL is required from you to be able to create the subscription and receive notifications.
Learn about API updates and new endpoints by subscribing to the [api.updated](https://iriscrm.com/api/#/paths/~1subscriptions~1sample~1api.updated/get) event.
Receive alerts in real-time including lead status changes, e-signature document actions, and helpdesk ticket changes.
Subscription API responses provide you with detailed information on a silver platter to avoid sorting through data unnecessarily.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [IRIS CRM](https://www.iriscrm.com) account
* Obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token)
 
## Quickstart

To use the IRIS Subscriptions connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/iris.subscriptions` module into the Ballerina project.
```ballerina
import ballerinax/iris.subscriptions;
```

### Step 2: Create a new connector instance
Create a `subscriptions:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
subscriptions:ApiKeysConfig config = {
    xApiKey: "<API_KEY>"
}
subscriptions:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a list of subscriptions using the connector.

    Return a list of subscriptions

    ```ballerina
    public function main() returns error? {
        subscriptions:InlineResponse20056 response = check baseClient->getSubscriptions();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
