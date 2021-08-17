## Overview
This is a generated connector for [Google Cloud Billing Account API](https://cloud.google.com/billing/docs/apis) OpenAPI specification.
The Google Cloud Billing Account API allows developers to manage billing for their Google Cloud Platform projects programmatically.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Cloud Billing Account connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/googleapis.cloudbillingaccount module into the Ballerina project.
```ballerina
import ballerinax/googleapis.cloudbillingaccount as cloudbillingaccount;
```
### Step 2: Create a new connector instance

You can now enter the credentials in the Google Cloud Billing Account client configuration and create Google Cloud Billing client by passing the configuration:

```ballerina
cloudbillingaccount:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

cloudbillingaccount:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation

1. You can list billing accounts as follows with `listBillingAccounts` method.

    ```ballerina
    cloudbillingaccount:ListBillingAccountsResponse billingAccounts = check baseClient->listBillingAccounts();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
