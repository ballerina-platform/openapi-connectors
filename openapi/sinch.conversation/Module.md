## Overview
This is a generated connector for [Sinch Conversation API v1.0](https://www.sinch.com/) OpenAPI specification. 

Send and receive messages globally over SMS, RCS, WhatsApp, Viber Business, Facebook messenger and other popular channels using the Sinch Conversation API. The Conversation API endpoint uses built-in transcoding to give you the power of conversation across all supported channels and, if required, full control over channel specific features.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Sinch account](https://www.sinch.com/) account
* Obtain tokens by following [this guide](https://developers.sinch.com/docs/conversation/api-reference#authentication).

## Quickstart

To use the Sinch Conversation connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/sinch.conversation` module into the Ballerina project.
```ballerina
import ballerinax/sinch.conversation;
```

### Step 2: Create a new connector instance
Create a `conversation:ClientConfig` with the `<USERNAME>` and `<PASSWORD>` obtained, and initialize the connector with it.
```ballerina
conversation:ClientConfig clientConfig = {
    auth: {
        username: <USERNAME>,
        password: <PASSWORD>
    }
};

conversation:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to send message using the connector. 

    ```ballerina
    public function main() {
        string projectId = "{PROJECT_ID}";
        conversation:SendMessageRequest request = {
            app_id: "{APP_ID}",
            message: {},
            project_id: "{PROJECT_ID}",
            recipient: {
                contact_id: "{CONTACT_ID}",
                identified_by: {
                    channel_identities: [
                        {
                            channel: "WHATSAPP",
                            identity: "string"
                        }
                    ]
                }
            }
        };

        conversation:SendMessageResponse|error response = baseClient->messagesSendmessage(projectId, request);
        if (response is conversation:SendMessageResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

