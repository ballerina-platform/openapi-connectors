## Overview
The Dropbox API v2 connector(https://www.dropbox.com/developers/documentation/http/overview) OpenAPI specification. 

Dropbox is a modern workspace designed to reduce busywork-so you can focus on the things that matter. Sign in and put your creative energy to work.  

### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Dropbox account](https://www.dropbox.com).
* Obtain tokens by following [this guide](https://www.dropbox.com/developers/documentation/http/documentation).

## Quickstart

To use the Dropbox connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/dropbox` module into the Ballerina project.
```ballerina
import ballerinax/dropbox;
```

### Step 2: Create a new connector instance
Create a `dropbox:ClientConfig` with the `<ACCESS_TOKEN>` obtained, and initialize the connector with it.
```ballerina
dropbox:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

dropbox:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to copy files or folders using the connector. 

    ```ballerina
    public function main() {
        dropbox:RelocationArg payload = {
            from_path: "/root/Homework/math/math.json",
            to_path: "/root/Homework1/math",
            autorename: true
        };

        dropbox:RelocationResult|error result = baseClient->copyFileOrFolder(payload);
        if (result is dropbox:RelocationResult) {
            log:printInfo(result.toString());
        } else {
            log:printError(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

