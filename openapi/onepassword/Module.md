## Overview
This is a generated connector from [1Password Connect API v1.3.0](https://1password.com/) OpenAPI specification.

1Password is the easiest way to store and use strong passwords. Log in to sites and fill forms securely with a single click.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [1Password](https://1password.com/) account
* Obtain tokens by following [this guide](https://support.1password.com/manage-secrets-automation/#issue-revoke-or-rename-an-access-token)

## Quickstart

To use the 1Password connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/onepassword` module into the Ballerina project.
```ballerina
import ballerinax/onepassword;
```

### Step 2: Create a new connector instance
Create a `shippit:ClientConfig` with the `API key` obtained, and initialize the connector with it.
```ballerina
onepassword:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

onepassword:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get API activity using the connector. 

    ```ballerina
    public function main() {
        onepassword:APIRequest[]|error response = baseClient->getApiActivity();
        if (response is onepassword:APIRequest[]) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

