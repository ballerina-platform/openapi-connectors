## Overview

This is a generated connector for [LaunchDarkly API v2.0](https://apidocs.launchdarkly.com/) OpenAPI specification.  
LaunchDarkly is a feature management platform enables teams to deploy code at any time, even if a feature isn't ready to be released to all users.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [LaunchDarkly account](https://launchdarkly.com/request-a-demo/). 
2. Obtain tokens - Follow [this guide](https://apidocs.launchdarkly.com/#section/Overview/Authentication).

## Quickstart

To use the LaunchDarkly connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/launchdarkly module into the Ballerina project.
```ballerina
import ballerinax/launchdarkly;
```
### Step 2: Create a new connector instance
You can initialize the client as follows. You can now provide the API key obtained from the LaunchDarkly in the configuration.

```ballerina
launchdarkly:ApiKeysConfig apiKeyConfig = {
    authorization: "<API_KEY>"
}

launchdarkly:Client baseClient = check new Client(apiKeyConfig, serviceUrl = ""https://app.launchdarkly.com/api/v2"");
```
### Step 3: Invoke connector operation
1. You can find all of the resource categories supported.
    ```ballerina
    launchdarkly:Links links = check baseClient->getRoot();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
