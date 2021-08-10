## Overview

This is a generated connector for [Sendgrid API v3](https://docs.sendgrid.com/api-reference/how-to-use-the-sendgrid-v3-api/) OpenAPI Specification. 

The Beta endpoints for the new Email Activity APIs - functionality is subject to change without notice. You may not have access to this Beta endpoint.

Email Activity offers filtering and search by event type for two days worth of data. There is an optional add-on to store 60 days worth of data. This add-on also gives you access to the ability to download a CSV of the 60 days worth of email event data.

## Configuring connector

### Prerequisites
* Vist [Sendgrid](https://sendgrid.com/) and create an account. 
* Obtain token
    - Obtain API Key visiting [Settings -> APIKeys](https://app.sendgrid.com/settings/api_keys) and provide obtained API Key as the token at HTTP client initialization. 
    - Configure [required permissions](https://docs.sendgrid.com/ui/account-and-settings/api-keys) when generating the API Key.

## Quickstart

To use the Sendgrid connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/sendgrid module into the Ballerina project.

```ballerina
import ballerinax/sendgrid;
```

### Step 2: Create a new connector instance
Configure the connection using the API-Key obtained. 

```ballerina
sendgrid:ClientConfig configuration = {
    authConfig: {
        token: "<API-Key>"
    }
};
sendgrid:Client sendgridClient = check new (configuration);
```

### Step 3: Invoke connector operation
1. send a marketing email to a customer. 

```ballerina
public function main() returns error? {
    sendgrid:SendMailRequest emailPayload = {
        personalizations : [{
            to: [{
                email: "<Receiver-Email>",
                name: "<Receiver-Name>"
            }]
        }],
        'from: {
            email: "<Sender-Email>",
            name: "<Sender-Name>"
        },
        content : [{
        'type: "text/plain",
        value: "<Email-Content>"
        }],
        subject: "<Email-Subject>"
    };
    _ = check sendgridClient->sendMail(emailPayload);
}
```
2. Use `bal run` command to compile and run the Ballerina program.
