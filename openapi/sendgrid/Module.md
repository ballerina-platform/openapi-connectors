## Overview

The Sendgrid connector consumes the data exposed in https://api.sendgrid.com/v3. .

This module supports SendGrid V3 API

## Configuring connector

### Prerequisites
* Sendgrid account 
    - Vist [Sendgrid](https://sendgrid.com/) and create an account. Note: SendGrid offers a [free plan](https://sendgrid.com/free/) for low-volume delivery, which may be useful in testing.

### Obtaining tokens

Follow the steps below to obtain the configurations.

1. Log in to your Sendgrid account. 
2. Configure your domain for email. Setting up a domain will show your emails as coming from your domain rather than via sendgrid.net, and the links your users click as coming from your domain. For more information, follow the [Domain Whitelabel Setup Guide](https://docs.sendgrid.com/ui/account-and-settings/how-to-set-up-domain-authentication).
3. For quick testing you can create a New Sender as described in [here](https://docs.sendgrid.com/ui/sending-email/senders). 
4. Create an API Key visiting [Settings -> APIKeys](https://app.sendgrid.com/settings/api_keys) providing `Email Send` permission and other required permissions.
5. Copy the API Key somewhere safe since it will only be visible one time.

## Quickstart

### Step 1: Import Sendgrid module
First, import the ballerinax/sendgrid module into the Ballerina project.

```ballerina
import ballerinax/sendgrid;
```

### Step 2: Configure the connection credentials.
Configure the Sendgrid connector using the API-Key obtained. 

```ballerina
sendgrid:ClientConfig configuration = {
    authConfig: {
        token: "<API-Key>"
    }
};
sendgrid:Client sendgridClient = check new (configuration);
```

### Step 3: Send email via Sendgrid
Following is code demonstrates how to send a marketing email using `ballerinax/sendgrid` connector. 

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

## Snippets

*  Retrieve all email addresses that are currently on your blocks list.

    ```ballerina
    sendgrid:SuppressionBlocks[] suppressionBlocks = check sendgridClient->getSuppressionBlocks();
    ```
*  Retrieve all spam reports.

    ```ballerina
    sendgrid:SpamReportDetails[] suppressionSpamReports = check sendgridClient->getSuppressionSpamReports();
    ```
Visit `ballerinax/sendgrid` connector [API Documentation](https://docs.central.ballerina.io/ballerinax/sendgrid/latest) to identify all the operations available. 
