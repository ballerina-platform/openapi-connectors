## Overview
Ballerina connector for Ably is connecting the Ably [REST API](https://ably.com/documentation/rest-api) via Ballerina language easily. It provides a way for a wide range of server and client devices to communicate with the Ably service over REST. The REST API does not provide a realtime long-lived connection to Ably, but in all other respects is a simple subset of the full [realtime messaging API](https://ably.com/documentation/realtime).

This module supports REST API version 1.1.0 for Ably.
 
## Obtaining tokens

### Prerequisites
- An Ably Account

### Obtaining tokens
1. Obtain your application key by logging into Ably and visiting https://ably.com/
2. Using one of the application keys created via the [application dashboard](https://knowledge.ably.com/how-do-i-access-my-app-dashboard), basic authentication provides the simplest method to authenticate with Ably.
3. The application key can be split at the first colon, with the initial segment being used as the username, and the remaining string (without the leading colon) used as the password.
**Note:** Tokens should be kept secret
 
## Quickstart

### Publish Message on a Channel

#### Step 1: Import Ably module
First, import the ballerinax/ably module into the Ballerina project.
```ballerina
import ballerinax/ably;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the application key split at the first colon as username and password.
```ballerina
ably:ClientConfig configuration = {
    authConfig: {
        username: <ABLY_USERNAME>,
        password: <ABLY_PASSWORD>
    }
};

ably:Client ablyClient = check new(configuration);

```
#### Step 3: Publish a new Message

```ballerina
public function main() {
    ably:Message message = {
        name: "my_event_name",
        data: "my_event_data"
    };
    ably:InlineResponse2xx1|error response = baseClient->publishMessagesToChannel("rest-example", message);
}
``` 

### Retrieve Message History for a Channel

#### Step 1: Import Ably module
First, import the ballerinax/ably module into the Ballerina project.
```ballerina
import ballerinax/ably;
```

#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the application key split at the first colon as username and password.
```ballerina
ably:ClientConfig configuration = {
    authConfig: {
        username: <ABLY_USERNAME>,
        password: <ABLY_PASSWORD>
    }
};

ably:Client ablyClient = check new(configuration);

```

#### Step 3: Retrieve Message History for a Channel

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