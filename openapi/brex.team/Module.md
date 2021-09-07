## Overview
This is a generated connector for [Brex Team API v0.1](https://developer.brex.com/openapi/team_api/) OpenAPI specification. 

Team API lets you manage users, departments, locations and cards.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Brex account](https://www.brex.com/) account
* Obtain tokens by following [this guide](https://developer.brex.com/docs/authentication/)

## Quickstart

To use the Brex Onboarding connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/brex.team` module into the Ballerina project.
```ballerina
import ballerinax/brex.team;
```

### Step 2: Create a new connector instance
Create a `team:ClientConfig` with the `<ACCESS_TOKEN>` obtained, and initialize the connector with it.
```ballerina
team:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

team:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list referrals created using the connector. 

    ```ballerina
    public function main() {
        team:ReferralPage|error response = baseClient->listReferralsGet();
        if (response is team:ReferralPage) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

