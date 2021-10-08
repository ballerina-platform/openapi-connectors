## Overview
This is a generated connector for [Interzoid Email Info API v1.0.0](https://interzoid.com/services/getemailinfo) OpenAPI specification.

This API provides validation information for an email address in the input parameter to aid in deliverability. It will also provides additional demographic and descriptive data about the email address.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Interzoid Account](https://www.interzoid.com/register)
* Obtaining tokens by following [this link](https://www.interzoid.com/account) and obtain the license key.

## Quickstart
To use the Interzoid email info connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/interzoid.emailinfo module into the Ballerina project.

```ballerina
import ballerinax/interzoid.emailinfo as emailinfo;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using license key.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure license key in ballerina file directly. 

    ```ballerina
    emailinfo:ApiKeysConfig apiKeyConfig = {
        license:"<PRIVATE LICENSE KEY>"
    };
    emailinfo:Client myClient = check new Client(apiKeyConfig);
    ```

- Option 2 :
    Configure license key in `Config.toml` file and configure it in ballerina file, using configurables. 

    1. Set up license key in `Config.toml` as shown below.
    ```
    [apiKeyConfig.apiKeys]
    license:"<PRIVATE LICENSE KEY>"
    ```

    2. Configure the client in ballerina file as shown below.
    ```ballerina
    configurable ApiKeysConfig & readonly apiKeyConfig = ?;
    emailinfo:Client myClient = check new Client(apiKeyConfig);
    ```

### Step 3: Invoke connector operation
1. You can get invoke the connecter operation by providing a email address.
    ```ballerina
        emailinfo:EmailInfo emailInfo = myClient->getEmailInfo("johndoe@mail.com");
    ```
2. Use `bal run` command to compile and run the Ballerina program.