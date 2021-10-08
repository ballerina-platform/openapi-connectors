## Overview
This is a generated connector for [NamSor API v2](https://v2.namsor.com/NamSorAPIv2/index.html) OpenAPI specification. 

The NamSor API provides the capability to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [NamSor account](https://v2.namsor.com/NamSorAPIv2/sign-in.html)
* Obtain tokens - Follow [this link](https://v2.namsor.com/NamSorAPIv2/apidoc.html)

## Quickstart

To use the NamSor connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/namsor module into the Ballerina project.
```ballerina
import ballerinax/namsor;
```
### Step 2: Create a new connector instance
Add the project configuration file by creating a `Config.toml` file. Config file should have following configurations. Add the tokens obtained in the previous step to the `Config.toml` file.

```ballerina
namsor:ApiKeysConfig apiKeyConfig = {
    xApiKey: "<API_KEY>"
}

namsor:Client baseClient = check new Client(apiKeyConfig, serviceUrl = "https://v2.namsor.com/NamSorAPIv2");
```
### Step 3: Invoke connector operation
1. You can get origin of the name by providing first name and last name as parameters.
    ```ballerina
    namsor:FirstLastNameOriginedOut nameOrigin = check baseClient->origin("Jones", "Joe");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 