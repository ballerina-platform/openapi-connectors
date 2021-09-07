## Overview
This is a generated connector for [Brex Onboarding API v0.1](https://developer.brex.com/openapi/onboarding_api/) OpenAPI specification. 

Onboarding APIs allows partners to refer their customers to Brex to streamline the process of creating new accounts 
for these customers. By submitting information for referrals, it removes the need for customers to enter in this information again.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Brex account](https://www.brex.com/) account
* Obtain tokens by following [this guide](https://developer.brex.com/docs/authentication/)

## Quickstart

To use the Brex Onboarding connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/onboarding` module into the Ballerina project.
```ballerina
import ballerinax/onboarding;
```

### Step 2: Create a new connector instance
Create a `onboarding:ClientConfig` with the `<ACCESS_TOKEN>` obtained, and initialize the connector with it.
```ballerina
onboarding:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

onboarding:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list referrals created using the connector. 

    ```ballerina
    public function main() {
        onboarding:ReferralPage|error response = baseClient->listReferralsGet();
        if (response is onboarding:ReferralPage) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

