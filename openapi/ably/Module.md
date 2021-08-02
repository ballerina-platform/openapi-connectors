## Overview
This is a generated connector for [Ably REST API v1.1.0](https://ably.com/documentation/rest-api) OpenAPI specification. 
The [Ably REST API](https://www.ably.io/documentation/rest-api) provides a way for a wide range of server and client devices to communicate with the Ably service over REST. 
The REST API does not provide a realtime long-lived connection to Ably, but in all other respects is a simple subset of the full [realtime messaging API](https://ably.com/documentation/realtime).
 
## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Ably](https://ably.com/) account
* Obtain tokens following [this guide](https://ably.com/documentation/core-features/versions/v1.1/authentication).

**Note:** The application key can be split at the first colon, with the initial segment being used as the username, and the remaining string (without the leading colon) used as the password.
 
## Quickstart

To use the Ably connector in your Ballerina application, update the .bal file as follows

### Step 1: Import connector
First, import the `ballerinax/ably` module into the Ballerina project.
```ballerina
import ballerinax/ably;
```

### Step 2: Create a new connector instance
Create a `ably:ClientConfig` with the application key split at the first colon as username and password, and initialize the connector with it.
```ballerina
ably:ClientConfig configuration = {
    authConfig: {
        username: <ABLY_USERNAME>,
        password: <ABLY_PASSWORD>
    }
};
ably:Client ablyClient = check new(configuration);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to publish a new message using the connector.

    Publish a new message

    ```ballerina
    public function main() {
        ably:Message message = {
            name: "my_event_name",
            data: "my_event_data"
        };
        ably:InlineResponse2xx1|error response = baseClient->publishMessagesToChannel("rest-example", message);
    }
    ``` 

    Following is an example on how to retrieve message history for a channel using the connector.


    Retrieve message history for a channel

    ```ballerina
    public function main() {
        Message[]|error response = baseClient->getMessagesByChannel("rest-example");
        if (response is Message[]) {
            foreach var item in response {
                log:printInfo(item.toString());
            }
        } else {
            log:printError(response.message());
        }
    }


2. Use `bal run` command to compile and run the Ballerina program.
